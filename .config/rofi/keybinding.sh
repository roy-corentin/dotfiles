#!/usr/bin/env bash

rg "^bind =" ~/.config/hypr/hyprland.conf | sed 's/bind = //g' | awk -F, '{printf "%-15s %-10s %-10s %s\n", $1, $2, $3, $4}' | rofi -dmenu -i -p "Keybinds"
