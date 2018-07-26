## Here are some basic troubleshooting steps if you run into trouble
**_Home Assistant:_**

Once the HA files are installed you can test the basic installation using the GUI front-end thus avoiding any of the Google Voice command issues:
  - From the LMS Controls GUI, select a player and test the following functions and confirm they are received (using the LMS interface) on the selected player.  Test the following functions:  pause, play, next track, shuffle and repeat
  - If that works then fill out the source and artist fields and select the play artist function and ensure it gets queued to your selected player and starts playing.  Small bug, in the GUI, the commands are only issued on change so to issue the play artist command multiple times, you need to select the ______ command in between selections to reset the command.  Ya not cool but haven't got that figured out yet.
  - If you got this far, sounds like to HA components are working properly.
  - If the queuing functions are not functioning for either the LMS or Spotify sources (or both), confirm the shell scripts are operating properly (see troubelshooting shell commands).
  
**_Shell Commands:_**

The query functions for both LMS and Spotify music sources can be run on their own in a shell environment.  The general format for running the commands is: `bash command.sh $1 $2 $2` where command is the shell command name, $1 is the first parameter to pass (ie: artist) $2 is the second parameter (ie: album) and $3 is the third parameter (ie: song).  Below are some of the commands and expected results which then get returned to HA.


  
  
