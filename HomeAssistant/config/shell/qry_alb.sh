#!/bin/bash  

query=$(printf "artists 0 20 search:$1 tags:a \nexit\n" | nc localhost 9090 )
zero_chk=$query
art_id=${query#artists*id%3A}
art_id=${art_id%% artist*3A*}
zero_chk=${zero_chk##artist*count%3A}
echo 
echo "Artists are:"
echo $query
echo
echo "Artist check zero is:" $zero_chk
echo
if [ $zero_chk == 0 ]
then
    echo
    echo "Artists not found so set art_id = 0 and query only alb"
    art_id="0"
    echo
    echo "Artist found so moving on to albums...."
    query=$(printf "albums 0 20 search:$2 tags:al \nexit\n" | nc localhost 9090 )
    zero_chk=$query
    alb_id=${query#album*tags*id%3A}
    alb_id=${alb_id%% album*3A*}
    zero_chk=${zero_chk##album*count%3A}
    echo 
    echo "Album check zero is:" $zero_chk
    echo
    echo
    echo "Albums are:"
    echo $query
    if [ $zero_chk == 0 ]
    then
        echo
        echo "no album match setting ID to 0"
        alb_id="0"
    fi
    echo "There's no complete match:"
else
    echo
    echo "Artist found so moving on to albums...."
    query=$(printf "albums 0 20 artist_id:$art_id search:$2 tags:al \nexit\n" | nc localhost 9090 )
    zero_chk=$query
    alb_id=${query#album*tags*id%3A}
    alb_id=${alb_id%% album*3A*}
    zero_chk=${zero_chk##album*count%3A}
    echo 
    echo "Album check zero is:" $zero_chk
    echo
    echo
    echo "Albums are:"
    echo $query
    if [ $zero_chk == 0 ]
    then
        echo
        echo "no album match setting ID to 0"
        alb_id="0"
    fi
fi
echo
echo "Artist ID is:$art_id"
echo "Album ID is: $alb_id"
echo "now Posting results"
echo



curl -X POST -d '{"state":"'"${art_id}"'"}' https://HA_Link.duckdns.org/api/states/sensor.art_ID?api_password=HA_API_Password
echo
curl -X POST -d '{"state":"'"${alb_id}"'"}' https://HA_Link.duckdns.org/api/states/sensor.alb_ID?api_password=HA_API_Password
echo