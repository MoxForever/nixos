#!/usr/bin/bash

if [[ $SWAYNC_TOGGLE_STATE == true ]]; then
	wpctl $@ on
else
	wpctl $@ off
fi

