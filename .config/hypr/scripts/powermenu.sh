#!/bin/bash

if [[ $(pidof rofi) ]]; then
    pkill rofi
    exit 1
fi

show_power_menu() {
  # The first characters are invisible sort keys.
  local menu_options="\u200B Lock
\u2060󰜉 Restart
\u2060󰐥 Shutdown
\u2060󰍹 Toggle laptop monitor
\u2060󰠚 Logout"

# suspend="󰒲  Sleep"

  local selection=$(echo -e "$menu_options" | rofi -dmenu --prompt "Power Options" -theme-str 'window { width: 20%; height: 40%; }' -O alphabetical -i)

  case "$selection" in
  *Lock*) hyprlock ;;
  *Restart*) systemctl reboot ;;
  *Shutdown*) systemctl poweroff ;;
  *Toggle*) ~/.config/hypr/scripts/laptop-monitor-toggle.sh ;;
  *Logout*) systemctl poweroff ;;
  esac
}

show_power_menu
