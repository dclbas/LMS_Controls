## Here are some basic troubleshooting steps if you run into trouble
**_Home Assistant:_**

Once the HA files are installed you can test the basic installation using the GUI front-end thus avoiding any of the Google Voice command issues:
  - From the LMS Controls GUI, select a player and test the following functions and confirm they are received (using the LMS interface) on the selected player.  Test the following functions:  pause, play, next track, shuffle and repeat
  - If that works then fill out the source and artist fields and select the play artist function and ensure it gets queued to your selected player and starts playing.  Small bug, in the GUI, the commands are only issued on change so to issue the play artist command multiple times, you need to select the ______ command in between selections to reset the command.  Ya not cool but haven't got that figured out yet.
  - If you got this far, sounds like to HA components are working properly.
  - If the queuing functions are not functioning for either the LMS or Spotify sources (or both), confirm the shell scripts are operating properly (see troubelshooting shell commands).
  
**_Shell Commands:_**

The query functions for both LMS and Spotify music sources can be run on their own in a shell environment.  The general format for running the commands is: `bash command.sh $1 $2 $3` where command is the shell command name, $1 is the first parameter to pass (ie: artist) $2 is the second parameter (ie: album) and $3 is the third parameter (ie: song).  Below are some of the commands and expected results which then get returned to HA.

A typical query against the LMS database in this case is shown below:

```bash-4.4# bash qry_alb.sh supertramp breakfast_in_america```

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
{"attributes": {}, "entity_id": "sensor.alb_id", "last_changed": "2018-07-26T23:38:14.423206+00:00", "last_updated": "2018-07-26T23:38:14.423206+00:00", "state": "3661"}```

In this case it picked out Artists ID: 2909 and Album ID: 3661 and posted those reults to sensor.art_id and sensor.alb_id respectively.
  
  
