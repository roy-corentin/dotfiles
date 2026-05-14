#!/usr/bin/env bash

if [[ $(pidof rofi) ]]; then
    pkill rofi
    exit 1
fi

if theme=$(wal --theme | awk -F ' - ' '/^[[:space:]]*-/ { print $NF }' | rofi -dmenu -mesg 'Select theme' | sed "s/ (last used)//"); then
    if [[ "$theme" == "" ]]; then
        echo "No theme selected. Exit program..."
        exit
    fi
    echo "$theme"
    wal --cols16 --theme "$theme"
    cp ~/.cache/wal/colors-hypr.lua ~/.config/hypr/colors.lua
    emacsclient -e "(cr/switch-theme '$theme)"
    swaync-client -rs
else
    echo "$theme"
fi
