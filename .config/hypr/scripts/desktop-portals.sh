#!/bin/bash
sleep 1
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-gnome
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal
/usr/lib/xdg-desktop-portal-hyprland &
/usr/lib/xdg-desktop-portal-kde &
# /usr/lib/xdg-desktop-portal-wlr &
sleep 2
/usr/lib/xdg-desktop-portal &
