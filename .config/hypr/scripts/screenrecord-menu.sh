menu() {
  local prompt="$1"
  local options="$2"
  local extra="$3"
  local preselect="$4"

  read -r -a args <<<"$extra"

  if [[ -n "$preselect" ]]; then
    local index
    index=$(echo -e "$options" | grep -nxF "$preselect" | cut -d: -f1)
    if [[ -n "$index" ]]; then
      args+=("-c" "$index")
    fi
  fi

  echo -e "$options" | ~/.config/hypr/scripts/walker-menu.sh --dmenu --width 295 --minheight 1 --maxheight 600 -p "$prompt…" "${args[@]}" 2>/dev/null
}

show_screenrecord_menu() {
  case $(menu "Screenrecord" "  Region\n  Region + Audio\n  Display\n  Display + Audio\n  Display + Webcam") in
  *"Region + Audio"*) ~/.config/hypr/scripts/screenrecord.sh region --with-audio ;;
  *Region*) ~/.config/hypr/scripts/screenrecord.sh ;;
  *"Display + Audio"*) ~/.config/hypr/scripts/screenrecord.sh output --with-audio ;;
  *"Display + Webcam"*) ~/.config/hypr/scripts/screenrecord.sh output --with-audio --with-webcam ;;
  *Display*) ~/.config/hypr/scripts/screenrecord.sh output ;;
  esac
}

if pgrep -f "gpu-screen-recorder" >/dev/null || pgrep -x slurp >/dev/null; then
    ~/.config/hypr/scripts/screenrecord.sh
else
    show_screenrecord_menu
fi
