#!/bin/bash  
HA_Token=Your_Long_Lived_Token_Here
client_id=Spotify_Client_ID
client_secret=Spotify_Client_Secret
auth=$client_id":"$client_secret
b64=`echo -n "$auth"|base64`
b64=$(echo $b64 | tr -d ' ')
RESULTS=$(curl -X "POST" -H "Authorization: Basic $b64" -d grant_type=client_credentials https://accounts.spotify.com/api/token) 
token=$(echo $RESULTS | jq -r '.access_token')
RESULTS=$(curl -X GET "https://api.spotify.com/v1/search?q=%22$1%22&type=playlist&limit=5" -H "Authorization: Bearer $token")
echo
echo the results are: $RESULTS
echo
echo
uri=$(echo $RESULTS | jq -r '.playlists.items[0].uri')
name=$(echo $RESULTS | jq -r '.playlists.items[0].name')
echo
echo 'uri is: '$uri';  Name is: '$name
echo
curl -X POST -d '{"state":"'"${uri}"'"}' https://HA_Link.duckdns.org/api/states/sensor.spotify_uri? -H "Authorization Bearer $HA_Token"
curl -X POST -d '{"state":"'"${name}"'"}' https://HA_Link.duckdns.org/api/states/sensor.lms_name? -H "Authorization Bearer $HA_Token"
