#!/usr/bin/env bash

if [[ $(pidof wofi) ]]; then
    pkill wofi
    exit 1
fi

theme=$(wal --theme | awk -F ' - ' '/^[[:space:]]*-/ { print $NF }' | wofi --dmenu --prompt 'Select theme')

echo "$theme"

wal --cols16 --theme "$theme"

swaync-client -rs
