## Home Assistant Version 0.83 and Up - API_Password Deprecated
Please note if you upgrade your Home Assistant installation to version 0.83.2 the use of api_password is no longer supported (as pointed out by @kalimeroo) and your webhooks and shell script authentication will need to change to use long-lived tokens.

I will provide an update on the methods in the GitHub https://github.com/ynot123/LMS_Controls over the next week or two. The change is not very complicated but will require an update in several locations including the shell scripts and DialogFlow webhooks.

Standby....

Ynot.

## LMS Controls:
Control your Logitech / Squeezeserver players (LMS) from Home Assistant (HA) and Google Home (GH). A little [audio demo](https://github.com/ynot123/LMS_Controls/blob/master/LMS%20Controls%20Demo.mp3) is available.  Also see the Home Assistant GUI below.

Some [example](https://github.com/ynot123/LMS_Controls/blob/master/example_commands.md) commands include:
- "Hey google ask LMS Controls to play album Dog and Butterfly by Heart in the kitchen with shuffle on"
- "Set volume to 50" or "Set sleep timer to 30 minutes" or "Set shuffle on"
- "Link the garage with the mediaroom"
## What Can It Do:
Allows voice control for your Logitech Media Server (LMS) from Google Home (GH) or Google Assistant (GA) with Home Assistant (HA) acting as the middle man.  Using these tools, you can do the following:

- Perform queries for songs, albums, artists and playlists from the LMS server or from the music source Spotify
- Functionality includes:
	- Play queried items
	- Add to current playlist
	- Set music source (local LMS database or Spotify (using spotty)
	- Set volume
	- Set sleep timer
	- Set shuffle on / off
	- Set repeat on / off
	- Next track
	- Pause and re-start players
	- Sync / Link squeeze players
- A HA GUI front-end for the query tool is also included for use inside Home Assistant
- Using HA you can further enhance the LMS tools to create home automation scenes (ie: play your favorite radio station when you get home, turn down the lights when listening to music

See the following link for some examples of the voice commands available: [example_commands.md](https://github.com/ynot123/LMS_Controls/blob/master/example_commands.md)

## Basic Approach:
The basic approach is as follows:
​	
- Voice Intents are handled by Dialogflow (DF) where you define the following:
	- LMS command you want (set volume, play artist, etc..)
	- Set the details of the query (artist name, song title, etc.)
	- Set the player name and any additional parameters like shuffle on, etc..
	- DF then sends a web hook to HA software containing all the information outlined above
- HA receives the web hook and:
	- Determines the values sent from DF
	- If this is music query function:
		- Performs required queries against either LMS DB or Spotify using shell scripts
		- Shell scripts return the desired link(s) based on the above query paramters
		- The returned links are then queued to the proper player using HA's Logitech Squeezebox component
	- If this a set function (volume, shuffle, repeat) Home Assistant simply sets the value using the Media Control or Logitech Squeezebox component as required
	- The HA package also contains a Lovelace and Traditional GUI front-end to perform the same functions as the GH voice system provides
	- In addition, HA allows automation routine extensions to the LMS system.  These can include:
		- Synchronize squeeze players **new**
		- Launch favorite audio when you get home
		- Automatic setting of scenes when players start playing (ie: dim the lights, switch on certain outlets)
		- Paging / general announcements throughout the home 

## Prerequisites:
To make this work, you need the following:
- Logitech Media Server
- Home Assistant - open source home automation package
- Google Home (or google assistant)
- Developer account for Dialogflow for the voice activation part
- Optional Spotify account with Client_ID and Client_Secret to allow processing of Spotify music source

## Installation:	
Read the README.md in each software directory for the details.  Nothing here is automatic but with a bit of technical knowledge and perseverance you should be able to get there from here.
​	
## Home Assistant GUIs for LMS Player Controls Tool:

**Lovelace GUI** on the left and **Traditional HA GUI** on the right:

<img src="https://github.com/ynot123/LMS_Controls/blob/master/HA_LMS_GUI.jpg" alt="Lovelace Based GUI" width="450px"/> <img src="https://github.com/ynot123/LMS_Controls/blob/master/HA_LMS_GUI_STD.jpg" alt="Traditional GUI" width="402px"/>



## Troubleshooting:
See the following link for some basic troubleshooting tips [troubleshooting.md](https://github.com/ynot123/LMS_Controls/blob/master/troubleshooting.md)
## Some Useful Links:
[Logitech Squeezebox Server](https://mysqueezebox.com/index/Home)\
Wonderful full featured media server supporting tons of features, almost all protocols, most music sources, allowing you to listening to what you want, where you want throughout your home on one or many players at the same time.

[Home Assistant](https://www.home-assistant.io/)\
Home Assistant is an open source home automation platform running on Python 3. It is able to track and control all devices at home and offers a platform for automating control.

[Dialogflow](https://dialogflow.com/)\
Dialogflow is a conversational platform that gives users new ways to interact with their products by building engaging voice and text-based conversational interfaces, such as voice apps and chatbots, powered by AI. It features an easy-to-use front-end, natural language understanding (NLU), machine learning, and more.

[Spotify Developer](https://developer.spotify.com/)\
Where music meets code. Exposes powerful APIs, SDKs and widgets for integration of simple and advanced applications. 

## Our Support Communities:
[Squeezebox Community Forums](https://forums.slimdevices.com/)\
Anything you need to know about your LMS server is here.   

[Home Assistant Community Forums](https://community.home-assistant.io/)\
All about Home Assistant.  Lots of development and support going on here.  

[Dialogflow Support](https://productforums.google.com/forum/#!forum/dialogflow)\
Haven't had to use this one so far.  
