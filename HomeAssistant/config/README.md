## Home Assistant Config Directory
The files in this directory and sub-directories are required.  Only the entries pertinent to this application are shown.  For example the configuration.yaml file only shows the additional entries required for this application (mainly input_boolean, input_select, input_text, etc..)
In short you need to add these entries to your existing configuration.yaml, scripts files, etc. as required.

## Modifications Required

The following files need to be edited to add your personal access keys, secrets, links and passwords for access to Home Assistant, Spotify, LMS Server, etc..
- **_configuration.yaml_** file:
  - The contents of this file is to be merged into your existing configuration.yaml file.  The additions / changes required are:
    - **_media_player_** component:
      - Change LMS_Host_IP to your LMS host IP address (ie: 192.168.x.x)
      - Optional username and password for those using secured versions of LMS
    - **_dialogflow_** component:
      - Defines the name of the intent script
    - **_shell_command_** component:
      - Lists the shell scripts to be used along with the template information required
      - If you are using a secured version of LMS, the following updates need to be made:
        - Change ***qry_alb.sh*** to ***qry_alb_sec.sh***
        - Change ***qry_alb_song.sh*** to ***qry_alb_song_sec.sh***
      - When troubleshooting, you can run these scripts in a shell independently of HA to see the results of your queries
    - **_input_number, input_boolean, input_select, input_text_** components:
      - Input variables required for the application
      - **_lms_player_** input_select entry needs to be modified to reflect the entity names (the part after the `media_player.`) of your existing LMS players.  As an example entity `media_player.kitchen` the name would be **kitchen**
      - **_lms_sync_master_** input_select entry needs to be modified to reflect the entity names of your existing LMS players
      - **_lms_playerX_sync_** input_boolean(s) need to be modified changing the value of `name:` field to the entity name of the players you wish to have as a sync destination (upto 5 are allowed, more will need minor code modifications) 
- **_automations.yaml_** file:
  - The contents of this file is to be merged into your existing automations.yaml file.  The automation additions include:
    - An entry for each LMS Player Control GUI function.  These include:
        - Volume, Sleep Timer, Shuffle, Repeat, Pause, Re-start, Next Track and LMS_commands for (Add / Play artists, albums, songs, playlists and radio stations) and sync functions
- ***intent.yaml*** file:
  - Copy this file to your HA config directory.  It contains the Action Intents defined in DialogFlow.  The webhooks in DF land here.
- **_script_lms_controls.yaml_** file:
  - The contents of this file need to be merged into your current scripts.yaml file.  This file performs the following functions:
    - Sets the input variables returned from DialogFlow (Google Home Requests)
    - Calls the query functions to determine song, album, artist or playlist links from either LMS database or Spotify
    - Adds the links to the selected media player queue using either ADD or PLAY functions
    - Provides Pause, Re-start or Next track functions for selected player
  - Provides sync and unsync functions from DialogFlow
- **_shell_** sub-directory:
  - For the files:  qry_alb.sh, qry_alb_song.sh the following modifications are required:
    - Replace `Your_Long_Lived_Token_Here` with `your Token from your HA installation`
    - Replace `lms_ipaddress` with `your LMS IP address (ie: 192.168.0.10)`
    - Update `https://HA_Link.duckdns.org/api/states/sensor.art_ID? -H "Authorization Bearer $HA_Token"` with you're `HA_Link` (must be accessible from the internet)
  - For the files:  spot_art_alb.sh, spot_art_alb_song.sh, spot_art_top.sh and spot_playlist.sh the following modifications are required:
    - Replace `Your_Long_Lived_Token_Here` with `your Token from your HA installation`
    - Replace `Spotify_Client_ID` with `your Spotify_Client_ID`
    - Replace `Spotify_Client_Secret` with `your Spotify_Client_Secret`
    - Update `https://HA_Link.duckdns.org/api/states/sensor.art_ID? -H "Authorization Bearer $HA_Token"` with you're `HA_Link` (must be accessible from the internet)
  - If you are using the secured version of LMS (ie: requires username and password to access LMS) you will need to modify the files:  qry_alb_sec.sh, qry_alb_song_sec.sh as follows:
    - Replace `lms_username` with `your LMS username` and  `lms_password` with `your LMS password` 
    - Replace `Your_Long_Lived_Token_Here` with `your Token from your HA installation`
    - Replace `lms_ipaddress` with `your LMS IP address (ie: 192.168.0.10)`
    - Update `https://HA_Link.duckdns.org/api/states/sensor.art_ID? -H "Authorization Bearer $HA_Token"` with you're `HA_Link` (must be accessible from the internet)
- **_customize.yaml_** file:
  - The content of this file can be merged into your `customize.yaml` file.
  - This file customizes some of the entity entries to reflect proper icons, names and for the media players adds an additional attribute with the MAC address as this is not directly available in HA
  - All **media_player** entries need to be modified to reflect the name of your media players and their respective MAC addresses.  This is required for the Sync tools ot function properly.
- **_groups.yaml_** file:
  - The content of this file can be merged into your `groups.yaml` file to create the basic GUI used in HA.  A somewhat better looking GUI is available when using the Lovelace GUI.
- **_ui-lovelace.yaml_** file:
  - The content of this file can be merged into your `ui-lovelace.yaml` file to create the Lovelace GUI used in HA.  A somewhat better looking GUI is available when using the LoveLace GUI.
