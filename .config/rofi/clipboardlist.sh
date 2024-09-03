#!/usr/bin/env bash

if [[ $(pidof rofi) ]]; then
    pkill rofi
    exit 1
fi

cliphist list | rofi -dmenu -display-columns 2 -p "" -width 200 | cliphist decode | wl-copy
