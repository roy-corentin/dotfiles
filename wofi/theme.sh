#!/usr/bin/env bash

if [[ $(pidof wofi) ]]; then
  pkill wofi
  exit 1
fi

theme=$(wal --theme | wofi --dmenu --prompt 'Select theme' | grep -o "base16-\([[:alpha:]]*-\?\)*" | head -n1)

echo "$theme"


wal --theme "$theme"
