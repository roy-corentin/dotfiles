#!/bin/bash

# Toggle to pop-out a tile to stay fixed on a display basis.

active=$(hyprctl activewindow -j)
addr=$(echo "$active" | jq -r  ".address")
[ -z "$addr" ] && { echo "No active window"; exit 0; }

hyprctl -q --batch \
"dispatch togglefloating address:$addr;" \
"dispatch centerwindow address:$addr;" \
"dispatch alterzorder top address:$addr;" \
"dispatch tagwindow +pop address:$addr;"
