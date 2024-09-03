#!/usr/bin/env bash

if [[ $(pidof rofi) ]]; then
    pkill rofi
    exit 1
fi

cliphist list | rofi -dmenu -display-columns 2 -p "" | cliphist decode | wl-copy
