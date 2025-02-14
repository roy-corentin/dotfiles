#!/usr/bin/env bash

if [[ $(pidof rofi) ]]; then
    pkill rofi
    exit 1
fi

if theme=$(wal --theme | awk -F ' - ' '/^[[:space:]]*-/ { print $NF }' | rofi -dmenu -mesg 'Select theme' | sed "s/ (last used)//"); then
    echo "$theme"
    wal --cols16 --theme "$theme"
    emacsclient -e "(cr/switch-theme '$theme)"
else
    echo "$theme"
fi
