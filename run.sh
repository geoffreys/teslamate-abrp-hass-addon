#!/usr/bin/with-contenv bashio

echo "Hello world!"

MQTT_HOST=$(bashio::config "mqtt_host")
MQTT_PORT=$(bashio::config "mqtt_port")
export MQTT_USERNAME=$(bashio::config "mqtt_user")
export MQTT_PASSWORD=$(bashio::config "mqtt_password")
ABRP_TOKEN=$(bashio::config "abrp_token")
CAR_NUMBER=$(bashio::config "car_number")
CAR_MODEL=$(bashio::config "car_model")

echo "host = $MQTT_HOST, user $MQTT_USERNAME, pw $MQTT_PASSWORD"
echo "abrp token $ABRP_TOKEN, car# $CAR_NUMBER, model $CAR_MODEL"

if [ -z "$CAR_MODEL" ]
then
  python3 -u teslamate_mqtt2abrp.py -a "$ABRP_TOKEN" $CAR_NUMBER "$MQTT_HOST" "$MQTT_USERNAME" "$MQTT_PASSWORD"
else
  python3 -u teslamate_mqtt2abrp.py -a "$ABRP_TOKEN" $CAR_NUMBER "$MQTT_HOST" "$MQTT_USERNAME" "$MQTT_PASSWORD" --model "$CAR_MODEL"
fi

echo "Teslamate ABRP Script ended"
