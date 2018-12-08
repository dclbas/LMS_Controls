#!/bin/bash  
HA_Token=Your_Long_Lived_Token_Here
query=$(printf "login lms_username lms_password\nartists 0 20 search:$1 tags:a \n" | socat stdio tcp:lms_ipaddress:9090,shut-none )
zero_chk=$query
art_id=${query#login*id%3A}
art_id=${art_id%% artist*3A*}
zero_chk=${zero_chk##login*count%3A}
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
    query=$(printf "login lms_username lms_password\nalbums 0 20 search:$2 tags:al \n" | socat stdio tcp:lms_ipaddress:9090,shut-none )
    zero_chk=$query
    alb_id=${query#login*tags*id%3A}
    alb_id=${alb_id%% album*3A*}
    name=${query#login*album%3A}
    name=${name%% artist*3A*}
    name=$(echo -e "${name//%/\\x}")
    zero_chk=${zero_chk##login*count%3A}
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
    query=$(printf "login lms_username lms_password\nalbums 0 20 artist_id:$art_id search:$2 tags:al \n" | socat stdio tcp:lms_ipaddress:9090,shut-none )
    zero_chk=$query
    alb_id=${query#login*tags*id%3A}
    alb_id=${alb_id%% album*3A*}
    name=${query#login*album%3A}
    name=${name%% artist*3A*}
    name=$(echo -e "${name//%/\\x}")
    zero_chk=${zero_chk##login*count%3A}
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
echo "Name is: $name"
echo "now Posting results"
echo



curl -X POST -d '{"state":"'"${art_id}"'"}' https://HA_Link.duckdns.org/api/states/sensor.art_ID? -H "Authorization Bearer $HA_Token"
echo
curl -X POST -d '{"state":"'"${alb_id}"'"}' https://HA_Link.duckdns.org/api/states/sensor.alb_ID? -H "Authorization Bearer $HA_Token"
echo
curl -X POST -d '{"state":"'"${name}"'"}' https://HA_Link.duckdns.org/api/states/sensor.lms_name? -H "Authorization Bearer $HA_Token"
echo