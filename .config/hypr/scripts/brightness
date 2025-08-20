#!/usr/bin/env bash

get_brightness() {
    LIGHT=$(brightnessctl -m | awk -F, '{print substr($4, 0, length($4))}')
    echo "${LIGHT}"
}

notify_user() {
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "Brightness : $(get_brightness)"
}

inc_brightness() {
    brightnessctl -e4 -n2 set 5%+ && notify_user
}

dec_brightness() {
    brightnessctl -e4 -n2 set 5%- && notify_user
}

if [[ "$1" == "--get" ]]; then
    get_brightness
elif [[ "$1" == "--inc" ]]; then
    inc_brightness
elif [[ "$1" == "--dec" ]]; then
    dec_brightness
else
    get_brightness
fi
