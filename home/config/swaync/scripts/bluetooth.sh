#!/bin/bash

if [[ $SWAYNC_TOGGLE_STATE == true ]]; then
	bluetoothctl power on
else
	bluetoothctl power off
fi
