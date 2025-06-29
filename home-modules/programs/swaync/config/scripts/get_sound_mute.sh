#!/usr/bin/bash

result=$(wpctl $@)
if [[ $result == "Mute: yes" ]]; then
	echo "true"
else
	echo "false"
fi
