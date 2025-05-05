#!/bin/bash

DEVICE_NAME="wlan1"

if [[ "$SWAYNC_TOGGLE_STATE" == "true" ]]; then
    iwctl device $DEVICE_NAME set-property Mode ap 
    notify-send "Hotspot" "Access Point started."
else
    iwctl device $DEVICE_NAME set-property Mode station
    notify-send "Hotspot" "Access Point stopped."
fi
