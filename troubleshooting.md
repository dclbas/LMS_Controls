## Here are some basic troubleshooting steps if you run into trouble
**_Home Assistant:_**

Once the HA files are installed you can test the basic installation using the GUI front-end thus avoiding any of the Google Voice command issues:
  - From the LMS Controls GUI, select a player and test the following functions and confirm they are received (using the LMS interface) on the selected player.  Test the following functions:  pause, play, next track, shuffle and repeat
  - If that works then fill out the source and artist fields and select the play artist function and ensure it gets queued to your selected player and starts playing.  Small bug, in the GUI, the commands are only issued on change so to issue the play artist command multiple times, you need to select the ______ command in between selections to reset the command.  Ya not cool but haven't got that figured out yet.
  - If you got this far, sounds like to HA components are working properly.
  - If the queuing functions are not functioning for either the LMS or Spotify sources (or both), confirm the shell scripts are operating properly (see troubelshooting shell commands).
  
**_Shell Commands:_**

The query functions for both LMS and Spotify music sources can be run on their own in a shell environment.  The general format for running the commands is: `bash command.sh $1 $2 $3` where command is the shell command name, $1 is the first parameter to pass (ie: artist) $2 is the second parameter (ie: album) and $3 is the third parameter (ie: song).  Below are some of the commands and expected results which then get returned to HA.

A typical query against the LMS database is shown below (notice spaces are replaced with _ for LMS queries):

```bash-4.4# bash qry_alb.sh _supertramp _breakfast_in_america```

Results in:
```Artists are:
artists 0 20 search%3Asupertramp tags%3Aa id%3A2909 artist%3ASupertramp count%3A1

Artist check zero is: 1


Artist found so moving on to albums....

Album check zero is: 3


Albums are:
albums 0 20 artist_id%3A2909 search%3Abreakfast_in_america tags%3Aal id%3A3661 album%3ABreakfast%20in%20America artist%3ASupertramp id%3A3665 album%3AThe%20Very%20Best%20Of%20Supertramp artist%3ASupertramp id%3A3668 album%3ARetrospectacle%3A%20The%20Supertramp%20Anthology artist%3ASupertramp count%3A3

Artist ID is:2909
Album ID is: 3661
now Posting results

{"attributes": {}, "entity_id": "sensor.art_id", "last_changed": "2018-07-26T23:38:14.363233+00:00", "last_updated": "2018-07-26T23:38:14.363233+00:00", "state": "2909"}
{"attributes": {}, "entity_id": "sensor.alb_id", "last_changed": "2018-07-26T23:38:14.423206+00:00", "last_updated": "2018-07-26T23:38:14.423206+00:00", "state": "3661"} 
```
In this case it picked out Artists ID: 2909 and Album ID: 3661 and posted those reults to sensor.art_id and sensor.alb_id respectively.  These values will later be used in the add or play LMS album script.
  

A typical query against the Spotify music source is shown below (notice spaces are replaced with + for Spotify queries):
  
```bash-4.4# bash spot_art_alb.sh supertramp breakfast+in+america```

Results in:

```  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   182  100   153  100    29    735    139 --:--:-- --:--:-- --:--:--   875
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  8615  100  8615    0     0  44637      0 --:--:-- --:--:-- --:--:-- 44637

the results are: { "albums" : { "href" : "https://api.spotify.com/v1/search?query=supertramp+breakfast+in+america&type=album&offset=0&limit=5", "items" : [ { "album_type" : "album", "artists" : [ { "external_urls" : { "spotify" : "https://open.spotify.com/artist/3JsMj0DEzyWc0VDlHuy9Bx" }, "href" : "https://api.spotify.com/v1/artists/3JsMj0DEzyWc0VDlHuy9Bx", "id" : "3JsMj0DEzyWc0VDlHuy9Bx", "name" : "Supertramp", "type" : "artist", "uri" : "spotify:artist:3JsMj0DEzyWc0VDlHuy9Bx" } ], "available_markets" : [ "AD", "AR", "AT", "AU", "BG", "BO", "BR", "CA", "CH", "CL", "CO", "CR", "CY", "CZ", "DE", "DK", "DO", "EC", "EE", "ES", "FI", "FR", "GB", "GT", "HK", "HN", "HU", "ID", "IE", "IL", "IS", "IT", "JP", "LI", "LT", "LV", "MC", "MT", "MX", "MY", "NI", "NL", "NO", "PA", "PE", "PH", "PL", "PT", "PY", "RO", "SE", "SG", "SK", "SV", "TH", "TW", "US", "UY", "ZA" ], "external_urls" : { "spotify" : "https://open.spotify.com/album/1zcm3UvHNHpseYOUfd0pna" }, "href" : "https://api.spotify.com/v1/albums/1zcm3UvHNHpseYOUfd0pna", "id" : "1zcm3UvHNHpseYOUfd0pna", "images" : [ { "height" : 637, "url" : "https://i.scdn.co/image/2410cabd97f92d9fee6112181d57568df7476aae", "width" : 640 }, { "height" : 299, "url" : "https://i.scdn.co/image/3688105a4087383eff61cf2ddc202b1134a0356b", "width" : 300 }, { "height" : 64, "url" : "https://i.scdn.co/image/0ba603d6c46fa527bf6457685deb16f8a554708a", "width" : 64 } ], "name" : "Breakfast In America (Deluxe Edition)", "release_date" : "1979-03-29", "release_date_precision" : "day", "type" : "album", "uri" : "spotify:album:1zcm3UvHNHpseYOUfd0pna" }, { "album_type" : "album", "artists" : [ { "external_urls" : { "spotify" : "https://open.spotify.com/artist/3JsMj0DEzyWc0VDlHuy9Bx" }, "href" : "https://api.spotify.com/v1/artists/3JsMj0DEzyWc0VDlHuy9Bx", "id" : "3JsMj0DEzyWc0VDlHuy9Bx", "name" : "Supertramp", "type" : "artist", "uri" : "spotify:artist:3JsMj0DEzyWc0VDlHuy9Bx" } ], "available_markets" : [ "CA", "MX", "US" ], "external_urls" : { "spotify" : "https://open.spotify.com/album/7i75GRwJbhDDiLi2uQHTtZ" }, "href" : "https://api.spotify.com/v1/albums/7i75GRwJbhDDiLi2uQHTtZ", "id" : "7i75GRwJbhDDiLi2uQHTtZ", "images" : [ { "height" : 640, "url" : "https://i.scdn.co/image/13a7be12b4696c88261dcc315f76c1af84067cb4", "width" : 640 }, { "height" : 300, "url" : "https://i.scdn.co/image/e2b521a5b6f66cfcb51d17496d712a917a7e5b02", "width" : 300 }, { "height" : 64, "url" : "https://i.scdn.co/image/a5ae0d75612bc9aa40d5bd505e570fa086b92b5f", "width" : 64 } ], "name" : "Breakfast In America", "release_date" : "1979-03-29", "release_date_precision" : "day", "type" : "album", "uri" : "spotify:album:7i75GRwJbhDDiLi2uQHTtZ" }, { "album_type" : "album", "artists" : [ { "external_urls" : { "spotify" : "https://open.spotify.com/artist/3JsMj0DEzyWc0VDlHuy9Bx" }, "href" : "https://api.spotify.com/v1/artists/3JsMj0DEzyWc0VDlHuy9Bx", "id" : "3JsMj0DEzyWc0VDlHuy9Bx", "name" : "Supertramp", "type" : "artist", "uri" : "spotify:artist:3JsMj0DEzyWc0VDlHuy9Bx" } ], "available_markets" : [ "AD", "AR", "AT", "AU", "BE", "BG", "BO", "BR", "CA", "CH", "CL", "CO", "CR", "CY", "CZ", "DE", "DK", "DO", "EC", "EE", "ES", "FI", "FR", "GB", "GR", "GT", "HK", "HN", "HU", "ID", "IE", "IL", "IS", "IT", "JP", "LI", "LT", "LU", "LV", "MC", "MT", "MX", "MY", "NI", "NL", "NO", "NZ", "PA", "PE", "PH", "PL", "PT", "PY", "RO", "SE", "SG", "SK", "SV", "TH", "TR", "TW", "US", "UY", "VN", "ZA" ], "external_urls" : { "spotify" : "https://open.spotify.com/album/1G40QqbxYWEeelWqf4hpbI" }, "href" : "https://api.spotify.com/v1/albums/1G40QqbxYWEeelWqf4hpbI", "id" : "1G40QqbxYWEeelWqf4hpbI", "images" : [ { "height" : 637, "url" : "https://i.scdn.co/image/c70086e018666b8da3fdcaf25fb3c34b2306f4be", "width" : 640 }, { "height" : 299, "url" : "https://i.scdn.co/image/0bd2e0fa69b3177c3596b8aa209f62e16c8cde2b", "width" : 300 }, { "height" : 64, "url" : "https://i.scdn.co/image/d265b064aa07a4b3a5258492fa20a6abc69d01b7", "width" : 64 } ], "name" : "Breakfast In America (Remastered)", "release_date" : "1979-03-29", "release_date_precision" : "day", "type" : "album", "uri" : "spotify:album:1G40QqbxYWEeelWqf4hpbI" }, { "album_type" : "single", "artists" : [ { "external_urls" : { "spotify" : "https://open.spotify.com/artist/7a2AgzWfEyFkgSAXjLe4T3" }, "href" : "https://api.spotify.com/v1/artists/7a2AgzWfEyFkgSAXjLe4T3", "id" : "7a2AgzWfEyFkgSAXjLe4T3", "name" : "Karaoke Universe", "type" : "artist", "uri" : "spotify:artist:7a2AgzWfEyFkgSAXjLe4T3" } ], "available_markets" : [ "AD", "AR", "AT", "AU", "BE", "BG", "BO", "BR", "CA", "CH", "CL", "CO", "CR", "CY", "CZ", "DE", "DK", "DO", "EC", "EE", "ES", "FI", "FR", "GB", "GR", "GT", "HK", "HN", "HU", "ID", "IE", "IL", "IS", "IT", "JP", "LI", "LT", "LU", "LV", "MC", "MT", "MX", "MY", "NI", "NL", "NO", "NZ", "PA", "PE", "PH", "PL", "PT", "PY", "RO", "SE", "SG", "SK", "SV", "TH", "TR", "TW", "US", "UY", "VN", "ZA" ], "external_urls" : { "spotify" : "https://open.spotify.com/album/6x22RM6z0nUhLX3te5eTyN" }, "href" : "https://api.spotify.com/v1/albums/6x22RM6z0nUhLX3te5eTyN", "id" : "6x22RM6z0nUhLX3te5eTyN", "images" : [ { "height" : 640, "url" : "https://i.scdn.co/image/ae67f5a47be8ed7fdac8403d1b540ee667a5acfb", "width" : 640 }, { "height" : 300, "url" : "https://i.scdn.co/image/e70e390ed859dceda521d6c53ddf4e35de5a57da", "width" : 300 }, { "height" : 64, "url" : "https://i.scdn.co/image/5a3b0b55fe026ea206c26b3d5403951cc7bdff0a", "width" : 64 } ], "name" : "Breakfast In America (Karaoke Version) [In the Style of Supertramp]", "release_date" : "2013-10-04", "release_date_precision" : "day", "type" : "album", "uri" : "spotify:album:6x22RM6z0nUhLX3te5eTyN" }, { "album_type" : "single", "artists" : [ { "external_urls" : { "spotify" : "https://open.spotify.com/artist/6pxlau9PGA7rC0KhOMsVAx" }, "href" : "https://api.spotify.com/v1/artists/6pxlau9PGA7rC0KhOMsVAx", "id" : "6pxlau9PGA7rC0KhOMsVAx", "name" : "Ameritz Audio Karaoke", "type" : "artist", "uri" : "spotify:artist:6pxlau9PGA7rC0KhOMsVAx" } ], "available_markets" : [ "AD", "AR", "AT", "AU", "BE", "BG", "BO", "BR", "CA", "CH", "CL", "CO", "CR", "CY", "CZ", "DE", "DK", "DO", "EC", "EE", "ES", "FI", "FR", "GB", "GR", "GT", "HK", "HN", "HU", "ID", "IE", "IL", "IS", "IT", "JP", "LI", "LT", "LU", "LV", "MC", "MT", "MX", "MY", "NI", "NL", "NO", "NZ", "PA", "PE", "PH", "PL", "PT", "PY", "RO", "SE", "SG", "SK", "SV", "TH", "TR", "TW", "US", "UY", "VN", "ZA" ], "external_urls" : { "spotify" : "https://open.spotify.com/album/2K7rWwk7x2PLX8lLcyYEG6" }, "href" : "https://api.spotify.com/v1/albums/2K7rWwk7x2PLX8lLcyYEG6", "id" : "2K7rWwk7x2PLX8lLcyYEG6", "images" : [ { "height" : 640, "url" : "https://i.scdn.co/image/1859571690e5bd06a07b39532b2217b43181eaa7", "width" : 640 }, { "height" : 300, "url" : "https://i.scdn.co/image/7228caeef066b9da92b16fc9a7528fdb8cd8f370", "width" : 300 }, { "height" : 64, "url" : "https://i.scdn.co/image/a98d40b1b54244c50e15fd9aea56e6ff4fd5e7dd", "width" : 64 } ], "name" : "Breakfast in America (In the Style of Supertramp) [Karaoke Version] - Single", "release_date" : "2013-12-18", "release_date_precision" : "day", "type" : "album", "uri" : "spotify:album:2K7rWwk7x2PLX8lLcyYEG6" } ], "limit" : 5, "next" : "https://api.spotify.com/v1/search?query=supertramp+breakfast+in+america&type=album&offset=5&limit=5", "offset" : 0, "previous" : null, "total" : 8 } }



uri is: spotify:album:1zcm3UvHNHpseYOUfd0pna

{"attributes": {}, "entity_id": "sensor.spotify_uri", "last_changed": "2018-07-27T00:05:28.674277+00:00", "last_updated": "2018-07-27T00:05:28.674277+00:00", "state": "spotify:album:1zcm3UvHNHpseYOUfd0pna"}
```
In this case the query retuned the album uri link: spotify:album:1zcm3UvHNHpseYOUfd0pna and posted that reult to sensor.spotify.uri for later use in the add or play spotify album script.
