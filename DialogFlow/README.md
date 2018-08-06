## Installation Details for the DialogFlow Component
In order to get started you need to sign up for an account at the [DialogFlow website](https://dialogflow.com).  Once complete, sign in to the console and:
- Create a New Agent, call it what you wish. Select your default language and time zone and finally click Create
- Under the DF Sidebar, click on the **gear icon** to call up your Agent settings
- Click on **Export and Import** and import the ZIP file `LMS_Control_Agent - Sanitized.zip`.  This will import the pre-defined entities and intents to be used by Google Home or Google Assistant.
- Under the **General Tab** ensure API Version is set to **V2 API**

**_Webhooks_** setup:
- Enable Webhooks under the fullfilment section of DF
- Fill in the URL field with https://HA_Link.duckdns.org/api/services/script/lms_control?api_password=HA_API_Password replacing `HA_Link` with your HA internet link and `HA_API_Password` with your HA API password.

**_Entities_** updates:
- Under the DF sidebar, select Entities and choose `@lms_player`.  Update the names and synonyms to reflect your player entity names and any synonyms you may have for them.  The player entity names are the part after the `media_player.`) of your existing LMS players in HA.  As an example entity `media_player.kitchen` the name would be **kitchen**
- Choose `@lms_source` and update the music source entity if required.  At this time, only LMS (local) and Spotify are supported.
- Choose `@lms_sync_player`.  Update the names and synonyms to reflect your (upto 5) sync destination player entity names and any synonyms you may have for them.  
