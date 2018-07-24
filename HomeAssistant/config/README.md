## Home Assistant Config Directory
The files in this directory and sub-directories are required.  Only the entries pertinenet to this application are shown.  For example the configuration.yaml file only shows the additional entries required for this application (mainly input_boolean, input_select, input_text, etc..)
In short you need to add these entries to your existing configuration.yaml, scripts files, etc. as required.

## Modifications Required
The following files need to be edited to add your personal acess keys, secrets, links and passwords for access to Home Assistant, Spotify, LMS Server, etc..
- **_configuration.yaml_** file:
  - The contents of this file is to be merged into your existing configuration.yaml file.  The additions / changes required are:
    - **_media_player_** component:
      - Change LMS_Host_IP to your LMS host IP adrress (ie: 192.168.x.x)
    - **_shell_command_** component:
      - Lists the shell scripts to be used along with the template information required
      - When troubleshooting, you can run these scripts in a shell independently of HA to see the results of your queries
    - **_input_number, input_boolean, input_select, input_text_** components:
      - Input variables required for the application
      - **_lms_player_** input_select entry needs to be modified to reflect the friendly name of your existing LMS players 
- **_automations.yaml_** file:
  - The contents of this file is to be merged into your existing automations.yaml file.  The automation additions include:
    - An entry for each LMS Player Control GUI function.  These include:\
          Volume, Sleep Timer, Shuffle, Repeat, Pause, Re-start, Next Track and LMS_commands for (Add / Play artists, albums, songs, playlists and radio stations) 
- **_script_lms_controls.yaml_** file:
  - The contents of this file need to be merged into your current scripts.yaml file.  This file performs the following functions:
    - Sets the input variables returned from DialogFlow (Google Home Requests)
    - Calls the query functions to determine song, album, artist or playlist links from either LMS database or Spotify
    - Adds the links to the selected media player queue using either ADD or PLAY functions
    - Provides Pause, Re-start or Next track functions for selected player
- **_shell_** sub-directory:
  - For the files:  qry_alb.sh, qry_alb_song.sh the following modifications are required:
    - Replace `localhost 9090` with `your path to LMS CLI interface & Port#`
    - Update `https://HA_Link.duckdns.org/api/states/sensor.art_ID?api_password=HA_API_Password` with you're `HA_Link` (accessible from the internet) and you're `HA_API_Password`
  
  
