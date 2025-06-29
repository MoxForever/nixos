#!/bin/bash

SCRIPTS_DIR="$(dirname "$0")/scripts"

if [ "$(id -u)" -eq 0 ]; then
    echo "Error: This script should not be run as root."
    exit 1
fi

if [ $# -eq 0 ]; then
    echo "Available commands:"
    ls $SCRIPTS_DIR
    exit 0
fi

file="$SCRIPTS_DIR/$1"
if [ -f "$file" ] && [ -x "$file" ]; then
    exec "$file" "${@:2}"
else
    echo "Command $1 does not exist"
    exit 1
fi

