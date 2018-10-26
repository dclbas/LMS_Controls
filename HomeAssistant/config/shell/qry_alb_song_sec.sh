#!/bin/bash  

query=$(printf "login username password\nartists 0 20 search:$1 tags:a \n" | socat stdio tcp:192.168.0.XX:9090,shut-none )
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
if [ $zero_chk == 0 ] || [ $1 = _ ]
then
    echo
    echo "Artists not found so set art_id = 0 and query only alb"
    art_id="0"
    echo
    echo "Artist found so moving on to albums...."
    query=$(printf "login username password\nalbums 0 20 search:$2 tags:al \n" | socat stdio tcp:192.168.0.XX:9090,shut-none )
    zero_chk=$query
    alb_id=${query#login*tags*id%3A}
    alb_id=${alb_id%% album*3A*}
    zero_chk=${zero_chk##login*count%3A}
    echo 
    echo "Album check zero is:" $zero_chk
    echo
    echo
    echo "Albums are:"
    echo $query
    echo
    echo $2
    if [ $zero_chk == 0 ] || [ $2 == '_' ]
    then
        echo
        echo "no album match setting ID to 0"
        echo "moving on to songs..."
        alb_id="0"
        query=$(printf "login username password\ntitles 0 20  search:$3 tags:al \n" | socat stdio tcp:192.168.0.XX:9090,shut-none )
        zero_chk=$query
        song_id=${query#login*tags*id%3A}
        song_id=${song_id%% title*3A*}
        zero_chk=${zero_chk##login*count%3A}
        echo 
        echo "Song check zero is:" $zero_chk
        if [ $zero_chk == 0 ]
        then
            echo
            echo "no song match setting ID to 0"
            echo "returning to post results..."
            song_id="0"
        fi
    else
        echo
        echo "Album found so moving on to songs...." 
        query=$(printf "login username password\ntitles 0 20  album_id:$alb_id search:$3 tags:al \n" | socat stdio tcp:192.168.0.XX:9090,shut-none )
        zero_chk=$query
        song_id=${query#login*tags*id%3A}
        song_id=${song_id%% title*3A*}
        zero_chk=${zero_chk##login*count%3A}
        echo 
        echo "Song check zero is:" $zero_chk
        if [ $zero_chk == 0 ] 
        then
            echo
            echo "no song match setting ID to 0"
            echo 
            song_id="0"
        fi
        echo
        echo "Songs are:"
        echo $query
    fi
    echo "There's no complete match:"
else
    echo
    echo "Artist found so moving on to albums...."
    query=$(printf "login username password\nalbums 0 20 artist_id:$art_id search:$2 tags:al \n" | socat stdio tcp:192.168.0.XX:9090,shut-none )
    zero_chk=$query
    alb_id=${query#login*tags*id%3A}
    alb_id=${alb_id%% album*3A*}
    zero_chk=${zero_chk##login*count%3A}
    echo 
    echo "Album check zero is:" $zero_chk
    echo
    echo
    echo "Albums are:"
    echo $query
    if [ $zero_chk == 0 ] || [ $2 == _ ]
    then
        echo
        echo "no album match setting ID to 0 and moving on to song"
        alb_id="0"
        query=$(printf "login username password\ntitles 0 20  artist_id:$art_id search:$3 tags:al \n" | socat stdio tcp:192.168.0.XX:9090,shut-none )
        zero_chk=$query
        song_id=${query#login*tags*id%3A}
        song_id=${song_id%% title*3A*}
        zero_chk=${zero_chk##login*count%3A}
        echo 
        echo "Song check zero is:" $zero_chk
        if [ $zero_chk == 0 ]
        then
            echo
            echo "no song match setting ID to 0"
            echo
            song_id="0"
        fi
        echo
        echo "Songs are:"
        echo $query
    else
        echo
        echo "Album found so moving on to songs...."
        query=$(printf "login username password\ntitles 0 20 artist_id:$art_id album_id:$alb_id search:$3 tags:al \n" | socat stdio tcp:192.168.0.XX:9090,shut-none )
        zero_chk=$query
        song_id=${query#login*tags*id%3A}
        song_id=${song_id%% title*3A*}
        zero_chk=${zero_chk##login*count%3A}
        echo 
        echo "Song check zero is:" $zero_chk
        if [ $zero_chk == 0 ]
        then
            echo
            echo "no song match setting ID to 0"
            echo
            song_id="0"
        fi
        echo
        echo "Songs are:"
        echo $query
    fi
fi
echo
echo "Artist ID is:$art_id"
echo "Album ID is: $alb_id"
echo "Song ID is: $song_id"
echo "now Posting results"
echo



curl -X POST -d '{"state":"'"${art_id}"'"}' https://HA_Link.duckdns.org/api/states/sensor.art_ID?api_password=HA_API_Password
echo
curl -X POST -d '{"state":"'"${alb_id}"'"}' https://HA_Link.duckdns.org/api/states/sensor.alb_ID?api_password=HA_API_Password
echo
curl -X POST -d '{"state":"'"${song_id}"'"}' https://HA_Link.duckdns.org/api/states/sensor.song_ID?api_password=HA_API_Password
echo






