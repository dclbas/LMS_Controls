#!/bin/bash  

client_id=Spotify_Client_ID
client_secret=Spotify_Client_Secret
auth=$client_id":"$client_secret
b64=`echo -n "$auth"|base64`
b64=$(echo $b64 | tr -d ' ')
RESULTS=$(curl -X "POST" -H "Authorization: Basic $b64" -d grant_type=client_credentials https://accounts.spotify.com/api/token) 
token=$(echo $RESULTS | jq -r '.access_token')
RESULTS=$(curl -X GET "https://api.spotify.com/v1/search?q=$1+$2&type=album&limit=5" -H "Authorization: Bearer $token")

#%20album:$2%20artist:$1
echo
echo the results are: $RESULTS
echo
echo
uri=$(echo $RESULTS | jq -r '.albums.items[0].uri')
echo
echo 'uri is: '$uri
echo
curl -X POST -d '{"state":"'"${uri}"'"}' https://HA_Link.duckdns.org/api/states/sensor.spotify_uri?api_password=HA_API_Password
