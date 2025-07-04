#!/bin/bash

# Check if any media player is actively playing music
if playerctl status 2> /dev/null | grep -q "Playing"; then
    exit 0  # Music is playing, exit without taking any action
else
    systemctl sleep
fi
