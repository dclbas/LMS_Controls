## LMS Controls - Change Log

**December 8, 2018**

- Updated DialogFlow to include:
  - Use of long lived token for HA authentication (api_password method is now deprecated)
  - Added Intent Actions in each DF intent to call proper HA Intents
  - Created new intent  "What's Playing ", which returns the artists song, name and album from the current player.  Optionally you can use "What's playing in the kitchen" to specify an alternate (not current) player   
- Updated the following Home Assistant files:
  - Added `intent.yaml` which contains the Intent Actions from DialogFlow and performs the proper actions, launches other scripts and provides feedback to Google
  - Updated `script_lms_controls.yaml` - initial script for setting values from DF has been removed to relocated to `intent.yaml`
- Updated `confguration.yaml` to include DialogFlow component and define `intent.yaml` script.  Also added support for secured versions of LMS
- Update all shell scripts to provide support for long lived tokens in HA
- Created shell scripts `qry_alb_sec.sh` and `qry_alb_song_sec.sh` to support secured versions of LMS and long lived tokens

**August 5th, 2018**

- Updated DF to include voice commands for Sync and Unsyc squeeze players
- Updated `script_lms_controls.yaml` for Sync and Unsync voice commands
- Updated `ui-lovelace.yaml` replaced turn-on with toggle as required by Lovelace upgrade

**August 2nd, 2018**
- Added Implicit Intents: "Hey Googe, Ask LMS Controls to play artist Pink Floyd in the kitchen"
- Updated HA GUI to include syncing of squeezebox players
- Streamlined DF dialog requirements
- Defaults (context) is now based on HA GUI values rather than coded in DF (ie: current player, current source)

**July 27th, 2018**
- Updated `script_lms_controls.yaml` - added filter for blank entries to prevent errors in log

**July 24th, 2018**
- Initial release

