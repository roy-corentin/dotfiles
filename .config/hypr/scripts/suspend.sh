#!/usr/bin/env bash

playerctl pause
amixer set Master mute

hyprlock &
systemctl suspend
