## LMS Controls Project Updated - December 8, 2018
If you've opened this file, I assume you have previously installed and configured this project and are looking at what's required to update it to the latest HA security model.

Here's the short and skinny.  If you are having trouble with this, please review the full documentation in each subdirectory

**Home Assistant**:

- Be sure your HA system is accessible from the internet
- On the HA integration screen *menu / configuration / integrations* choose Dialogflow. This will install the Dialogflow integration and give you the url you will need to use for Dialogflow including the Webhook ID.
- Create a long lived token for Dialogflow and shell scripts
- **config.yaml**:
  - Make sure to add the contents to your file. It contains the basic requirements for input variables, settings for LMS server and declaration for Dialogflow intent script.
- **intent.yaml**:
  - Copy this file to your config directory.  It contains the intent scripts that will run from DialogFlow webhooks
- **shell** sub-directory:
  - Copy the new shell scripts to your ***/config/shell*** subdirectory.
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
- ​      ◦ I believe you already have the modified shell script files using the long lived tokens.  If you need another copy let me know.

**DialogFlow**

- Create a DialogFlow Agent.
- Import the ***lms_controls_sanitized.zip*** file.
- Modify the Fulfillment section as follows:
  - Change the URL to that given during the HA DialogFlow integration step.
  - Add your long-lived token ID after the work Bearer on the Authorization key
  - Test the Agent in DialogFlow and Google Assistant

That should do it. Good  luck.  

Ynot.