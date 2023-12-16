#!/usr/bin/env bash

home="/home/croy"
wallpapers="$home/Pictures/wallpapers"

image=$(ls "$wallpapers" | wofi --dmenu --prompt 'Select wallpaper')
wallpaper="$wallpapers/$image"

if [[ -d $wallpaper ]]; then
  echo "$wallpaper is a directory"
  wallpaper_temp="$image"
  sleep 2
  wallpaper_location=$(ls "$wallpaper" | wofi -n --show dmenu -k "/dev/null")
elif [[ -f $wallpaper ]]; then
  echo "$wallpaper is a file"
else
  echo "$wallpaper is not valid"
  exit 1
fi

swww img "$wallpaper" --transition-type grow --transition-fps 60 --transition-duration 0.5 --transition-bezier 0.65,0,0.35,1 --transition-step 1

sleep 1.25

wal -i "$wallpaper"

~/Application/ChromiumPywal/generate-theme.sh
