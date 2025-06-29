#!/usr/bin/bash

state=$(bluetoothctl show | grep "Powered" | awk '{print $2}')

if [[ $state == "yes" ]]; then
	echo "true"
else
	echo "false"
fi
