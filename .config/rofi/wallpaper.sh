#!/usr/bin/env bash

wallpaper_directory="$HOME/.config/hypr/wallpapers"

chose_wallpaper() {
    if image=$(for file_path in $(ls $wallpaper_directory/*); do
                   file_name=$(echo $file_path | sed 's/.*\/\(.*\)/\1/')
                   echo -en "$file_name\0icon\x1f$file_path\n"
               done | rofi -dmenu -p " " -theme '~/.config/rofi/wallpaper.rasi'  -mesg 'Select wallpaper'); then
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

# swww img "$wallpaper_path" --transition-type grow --transition-fps 60 --transition-duration 0.5 --transition-bezier 0.65,0,0.35,1 --transition-step 1
hyprctl hyprpaper wallpaper ",$wallpaper_path,cover" # Empty first argument to enable wallpaper on every monitor

cat $wallpaper_path > ~/.cache/hyprpaper/current-wallpaper

if backend=$(echo -e "none\nwal\nhaishoku\ncolorthief" | rofi -dmenu -mesg 'Select backend'); then
    if [[ "$backend" == *none* ]]; then
        exit
    fi
    wal --cols16 -i "$wallpaper_path" --backend "$backend" --saturate 0.6
    emacsclient -e "(cr/switch-theme 'ewal-doom-vibrant)"
    swaync-client -rs
fi
