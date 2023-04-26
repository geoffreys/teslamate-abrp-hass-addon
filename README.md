# teslamate-abrp-hass-addon
TeslaMate to ABRP bridge - Home Assistant addon

**Experimental but seems to work in my install**

A Home Assistant addon which exports Tesla data from a TeslaMate install to A Better Route Planner (ABRP).

This is just a Home Assistant wrapper for the existing existing Python script which does the export at https://github.com/fetzu/teslamate-abrp

Requires:
- Home Assistant instance (HASS)
- MQTT enabled in HASS
- TeslaMate addon for Home Assistant https://github.com/matt-FFFFFF/hassio-addon-teslamate

Setup:
- Setup HASS and the TeslaMate addon and ensure it is working correctly
- On ABRP, create an account and add your vehicle, eg Tesla Model 3 2022
- Still on ABRP, navigate to the car settings and add the "Generic" connection (last one at the very bottom) to generate your user token. Make a note of that token and keep it to yourself.
- Install this addon and configure the addon with your MQTT broker (core-mosquitto is the default, no user/pass), set the ABRP token per the previous step, car# as 1 (unless you've added multiple vehicles to ABRP), optionally specify the car_model but this should be auto detected. Refer to https://github.com/fetzu/teslamate-abrp for further assistance on parameter values.
