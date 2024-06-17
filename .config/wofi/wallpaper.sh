#!/usr/bin/env bash

wallpaper_directory="$HOME/.config/hypr/wallpapers"

chose_wallpaper() {
    image=$(ls "$wallpaper_directory" | wofi --dmenu --prompt 'Select wallpaper')
    wallpaper_path="$wallpaper_directory/$image"

    if [[ -d $wallpaper_path ]]; then
        echo "$wallpaper_path is a directory"
        wallpaper_directory="$wallpaper_path"
        chose_wallpaper
    elif [[ -f $wallpaper_path ]]; then
        echo "$wallpaper_path is a file"
    else
        echo "$wallpaper_path is not valid"
        exit 1
    fi
}

if [[ $(pidof wofi) ]]; then
    pkill wofi
    exit 1
fi

chose_wallpaper

echo "$wallpaper_path"

backend=$(echo -e "wal\nhaishoku\ncolorthief" | wofi --dmenu --prompt 'Select backend')

swww img "$wallpaper_path" --transition-type grow --transition-fps 60 --transition-duration 0.5 --transition-bezier 0.65,0,0.35,1 --transition-step 1

sleep 1.25

wal --cols16 -i "$wallpaper_path" --backend "$backend" --saturate 0.6

swaync-client -rs
