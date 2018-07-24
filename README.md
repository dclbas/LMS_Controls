## LMS Controls
Control your Logitech / Squeezeserver players (LMS) from Home Assistant (HA) and Google Home (GH)

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
- A web GUI front-end for the query tool is also included for use inside Home Assistant
- Using HA you can further enhance the LMS tools to create home automation scenes (ie: play your favorite radio station when you get home, turn down the lights when listening to music
  
## Basic Approach:
The basic approach is as follows:
	
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
	- The HA package also contains a Lovelace based front-end to perform the same functions as the GH voice system provides
	- In addition, HA allows automation routine extensions to the LMS system.  These can include:
		- Launch favorite audio when you get home
		- Automatic setting of scenes when players start playing (ie: dim the lights, switch on certain outlets)
		- Paging / general announcements throughout the home 

## Prerequisites:
To make this work, you need the following:
- Logitech Media Server
- Home Assistant - open source home automation package
- Google Home (or google assistant)
- Developer account for Dialogflow for the voice activation part
- Spotify account with Client_ID and Client_Secret to allow query processing

## Installation:	
Read the README.md in each software directory for the details.  Nothing here is automatic but with a bit of technical knowledge and perseverance you should be able to get there from here.
	
## Home Assistant GUI for LMS Controls Tool
![Alt text](/HA_LMS_GUI.jpg?raw=true "Title")

## Some Useful Links:
[Logitech Squeezebox Server](https://mysqueezebox.com/index/Home)\
Wonderful full featured media server supporting tons of features, almost all protocols, most music sources, allowing you to listening to what you want, where you want throughout your home on one or many players at the same time.

[Home Assistant](https://www.home-assistant.io/)\
Home Assistant is an open source home automation platform running on Python 3. It is able to track and control all devices at home and offers a platform for automating control.

[Dialogflow](https://dialogflow.com/)\
Dialogflow is a conversational platform that gives users new ways to interact with their products by building engaging voice and text-based conversational interfaces, such as voice apps and chatbots, powered by AI. It features an easy-to-use front-end, natural language understanding (NLU), machine learning, and more.

## Our Support Communities:
[Squeezebox Community Forums](https://forums.slimdevices.com/)\
Anything you need to know about your LMS server is here.  

[Home Assistant Community Forums](https://community.home-assistant.io/)\
All about Home Assistant.  Lots of development and support going on here.  

[Dialogflow Support](https://productforums.google.com/forum/#!forum/dialogflow)\
Haven't had to use this one so far.  
