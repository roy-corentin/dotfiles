#!/usr/bin/env bash

if [[ $(pidof rofi) ]]; then
    pkill rofi
    exit 1
fi

rofi -show combi -combi-modes "window,drun,run" -modes "combi,window,filebrowser" -show-icons -p " " -theme '~/.config/rofi/appmenu.rasi'
