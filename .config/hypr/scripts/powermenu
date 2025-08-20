#!/bin/bash

if [[ $(pidof rofi) ]]; then
    pkill rofi
    exit 1
fi

show_power_menu() {
  # The first characters are invisible sort keys.
  local menu_options="\u200B Lock
\u200C󰤄 Suspend
\u200D Relaunch
\u2060󰜉 Restart
\u2063󰐥 Shutdown
\u2063󰠚 Logout"

# suspend="󰒲  Sleep"

  local selection=$(echo -e "$menu_options" | rofi -dmenu --prompt "Power Options" -theme-str 'window { width: 20%; height: 40%; }' -O alphabetical -i)

  case "$selection" in
  *Lock*) hyprlock ;;
  *Suspend*) systemctl suspend ;;
  *Relaunch*) hyprctl dispatch exit ;;
  *Restart*) systemctl reboot ;;
  *Shutdown*) systemctl poweroff ;;
  *Logout*) systemctl poweroff ;;
  esac
}

show_power_menu
