## Some Example Commands for DialogFlow / GoogleHome Interface
Once setup and configured you can use your Google Home or Google Assistant to issue voice commands to the LMS squeeze players.  The commands can be issued as explicit or implicit intents. 
## Explicit Intents
Explicit intents are the commands given to the app once it's been called up and is active on your Google device.  It's characterized by the startup phrase:  **"Hey google talk to LMS Controls"**.  This calls up the Welcome intent (**"How can I help?"**) of the app at wich time you are free to issue your voice commands.  Once all commands are issued you say **"Goodbye"** (or after 10 seconds of no requests) the App closes and returns control to the Google environment.
## Implicit Intents
Implicit intents is a voice command given to the google environment directly as part of the app start-up command.  It's characterized by the phrase **"Hey google ask LMS Controls to ...**.  This calls up the app, skips the Welcome intent and goes directly to the command issued after the phrase **"ask LMS Controls to...**.  The command is executed and in the LMS application, there is a 10 second pause that allows you to issue further follow-up commands directly (explicit intents) like **"set volume to 40"** or **"set shuffle on"** without having to re-issue the startup phrase.  After 10 seconds of no requests, the app exits and returns control to the google environment.
## Example Explicit Comands
**Start-Up Phrases:** are used to call up the app for Google Home or Google Assistant and prepare for explicit intents.
- "Hey google, talk to LMS Controls"
- "Hey google, LMS Controls"
