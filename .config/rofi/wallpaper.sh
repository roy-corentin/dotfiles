#!/usr/bin/env bash

wallpaper_directory="$HOME/.config/hypr/wallpapers"

chose_wallpaper() {
    if image=$(ls "$wallpaper_directory" | rofi -dmenu -mesg 'Select wallpaper'); then
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
    else
        exit 0
    fi
}

if [[ $(pidof rofi) ]]; then
    pkill rofi
    exit 1
fi

chose_wallpaper

echo "$wallpaper_path"

swww img "$wallpaper_path" --transition-type grow --transition-fps 60 --transition-duration 0.5 --transition-bezier 0.65,0,0.35,1 --transition-step 1

if backend=$(echo -e "wal\nhaishoku\ncolorthief" | rofi -dmenu -mesg 'Select backend'); then
    echo "$backend"

    wal --cols16 -i "$wallpaper_path" --backend "$backend" --saturate 0.6

    swaync-client -rs
fi
