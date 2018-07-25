## Installation Details for the DialogFlow Component
In order to get started you need to sign up for an account at the [DialogFlow website](https://dialogflow.com).  Once complete sign in to the console.
  - Create a New Agent, call it what you wish. Select your default language and time zone and finally click Create.
  - Under the DF Sidebar, click on the **gear icon** to call up your Agent settings.
  - Click on **Export and Import** and import the ZIP file `LMS_Control_Agent - Sanitized`

  - 


**_Webhooks_** setup:
- Enable Webhooks under the fullfilment section of DF
- Fill in the URL field with https://HA_Link.duckdns.org/api/services/script/lms_control?api_password=HA_API_Password replace HA_Link with your link and HA_API_Password with the HA API password.
