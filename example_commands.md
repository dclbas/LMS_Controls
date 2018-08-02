## Some Example Commands for DialogFlow / GoogleHome Interface
Once setup and configured you can use your Google Home or Google Assistant to issue voice commands to the LMS squeeze players.  The commands can be issued as explicit or implicit intents. 
## Explicit Intents
Explicit intents are the commands given to the app once it's been called up and is active on your Google device.  It's characterized by the startup phrase:  **"Hey google talk to LMS Controls"**.  This calls up the Welcome intent (**"How can I help?"**) of the app at wich time you are free to issue your voice commands.  Once all commands are issued you say **"Goodbye"** (or after 10 seconds of no requests) the App closes and returns control to the Google environment.
## Implicit Intents
Implicit intents is a voice command given to the google environment directly as part of the app start-up command.  It's characterized by the phrase **"Hey google ask LMS Controls to ...**.  This calls up the app, skips the Welcome intent and goes directly to the command issued after the phrase **"ask LMS Controls to...**.  The command is executed and in the LMS application, there is a 10 second pause that allows you to issue further follow-up commands directly (explicit intents) like **"set volume to 40"** or **"set shuffle on"** without having to re-issue the startup phrase.  After 10 seconds of no requests, the app exits and returns control to the google environment.
## Example Explicit Intent Commands
**Start-Up Phrases:** are used to call up the app for Google Home or Google Assistant and prepare for explicit intents.
  - "Hey google, talk to LMS Controls"
  - "Hey google, LMS Controls"
  - "OK google, ask for LMS Controls"

**Explicit Intents:** After the start-up phrase above, the LMS Controls apps is called up and the Welcome intent is played **"How can I help?"**. Now you are ready to issue the explicit intents (voice commands) to your players. Some example phrases are listed below by category.
- **Play** intents are structured as follows:  "Play [artist, album, song, playlist, radio] [name / title] using player [player name] with shuffle [on/off]".  The phrase "using player" can be substituted with "in the" for simplicity though accuracy may suffer a bit.  The "Play" command clears the existing queue of the player, loads the request and starts playing.
  - "Play artist Pink Floyd" or "Play artist Pink Floyd in the kitchen" or "Play artist Pink Floyd with shuffle on" or Play artist Pink Floyd in the kitchen with shuffle on"
  - "Play album Breakfast in America" or "Play album Crime of the Century by Supertramp" or Play ablum Pieces of Eight by Supertramp in the mediaroom with shuffle on"
  - "Play song Centerfold using player kitchen" or "Play song Dog and Butterfly by Heart".
  - "Play playlist Smooth Jazz" or "Play playlist classic rock in the garage with shuffle on"
  - "Play radio station Q92" or "Play radio station CBC in the bedroom"
- **Add** intents are structure exactly the same as the play intents. "Add [artist, album, song or playlist] [name / title] using player [player name] with shuffle [on/off]".  The "Add" command adds the request to the existing queue of the player.  If the plyer is idle, ith will remain idle thoug items will be added ot the queue.
  - "Add artist Don Henley" or "Add album Ripcord by Keith Urban in the mediaroom with shuffle on"
- **Pause** intent, pauses the named player.
  - "Pause player" or "Pause the mediaroom" or "Pause the kitchen"
- **Re-start** intent, starts or re-starts a paused player.
  - "Re-start player" or "Start the mediaroom"
- **Next track** intent, skips to the next track of the named player.
  - "Next track" or "Next track in the mediaroom"
- **Pause** intent, pauses the named player.
  - "Pause player" or "Pause the mediaroom" or "Pause the kitchen"
- **Set** intents are structured as follows:  "Set [volume, sleep timer, shuffle, repeat, player, source] to [value, time, on / off, player name, music source]". The set command values get stored in HA and are used as defaults unless specified directly in the intent.
  - "Set volume to 30" or "Set volume to 50 in the kitchen"
  - "Set sleep timer to 30 minutes" or "Set sleep timer to 45 minutes in the bedroom"
  - "Set shuffle on" or "Set shuffle off in the kitchen"
  - "Set repeat on" or "Set repeat off in the mediaroom
  - "Set player to the garage"
  - "Set music source to lms" or "Set music source to Spotify" or "set music source to local" - local and lms are the same
- **Help** intent, gives basic help for the LMS Controls app.
  - "Help"
- **Sample commands** intent, gives a detailed list of sample commands.
  - "Sample commands"



  
**Note:**  When items are lef out of the command (ie: player name, music source, etc..) LMS Controls uses the current value in the HA GUI to fill in.  If the item is critical, LMS Controls will prompt for it.
