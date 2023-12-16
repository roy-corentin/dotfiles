#!/usr/bin/env bash

home="/home/croy"
wallpapers="$home/Pictures/wallpapers"

image=$(ls "$wallpapers" | wofi --dmenu --prompt 'Select wallpaper')
wallpaper="$wallpapers/$image"

echo "$image" >> ~/wallpaper.log

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

echo "$wallpaper" >> ~/wallpaper.log

wal -i "$wallpaper"

echo $? >> ~/wallpaper.log

~/Application/ChromiumPywal/generate-theme.sh

cat ~/.cache/wal/sequences

swww img "$wallpaper" --transition-type grow --transition-fps 60 --transition-duration 0.5 --transition-bezier 0.65,0,0.35,1 --transition-step 1

