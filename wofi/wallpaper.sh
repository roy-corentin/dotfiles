#!/usr/bin/env bash

home="/home/croy"
wallpapers="$home/Pictures/wallpapers"

if [[ $(pidof wofi) ]]; then
  pkill wofi
  exit 1
fi

image=$(ls "$wallpapers" | wofi --dmenu --prompt 'Select wallpaper')
wallpaper="$wallpapers/$image"

if [[ -d $wallpaper ]]; then
  echo "$wallpaper is a directory"
  image=$(ls "$wallpaper" | wofi --dmenu --prompt 'Select wallpaper' -k "/dev/null")
  wallpaper="$wallpaper/$image"
elif [[ -f $wallpaper ]]; then
  echo "$wallpaper is a file"
else
  echo "$wallpaper is not valid"
  exit 1
fi

echo "$wallpaper"

backend=$(echo -e "wal\nhaishoku\ncolorthief" | wofi --dmenu --prompt 'Select backend')

swww img "$wallpaper" --transition-type grow --transition-fps 60 --transition-duration 0.5 --transition-bezier 0.65,0,0.35,1 --transition-step 1

sleep 1.25

wal -i "$wallpaper" --backend "$backend" --saturate 0.7

~/.config/hypr/scripts/statusbar
