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

get_webcam_list() {
    v4l2-ctl --list-devices 2>/dev/null | while IFS= read -r line; do
        if [[ $line != $'\t'* && -n $line ]]; then
            local name="$line"
            IFS= read -r device || break
            device=$(echo "$device" | tr -d '\t' | head -1)
            [[ -n $device ]] && echo "$device  $name"
        fi
    done
}

show_webcam_select_menu() {
    local devices=$(get_webcam_list)
    local count=$(echo "$devices" | grep -c . 2>/dev/null || echo 0)

    if [[ -z $devices ]] || ((count == 0)); then
        notify-send "No webcam devices found" -u critical -t 3000
        return 1
    fi

    if ((count == 1)); then
        echo "$devices" | awk '{print $1}'
    else
        menu "Select Webcam" "$devices" | awk '{print $1}'
    fi
}

show_screenrecord_menu() {
  omarchy-capture-screenrecording --stop-recording && exit 0

  case $(menu "Screenrecord" "  With no audio\n  With desktop audio\n  With desktop + microphone audio\n  With desktop + microphone audio + webcam") in
      *"With no audio") ~/.config/hypr/scripts/screenrecord.sh ;;
      *"With desktop audio") ~/.config/hypr/scripts/screenrecord.sh --with-desktop-audio ;;
      *"With desktop + microphone audio") ~/.config/hypr/scripts/screenrecord.sh --with-desktop-audio --with-microphone-audio ;;
      *"With desktop + microphone audio + webcam")
          local device=$(show_webcam_select_menu) || {
              return
          }
          ~/.config/hypr/scripts/screenrecord.sh --with-desktop-audio --with-microphone-audio --with-webcam --webcam-device="$device"
          ;;
  esac
}

if pgrep -f "gpu-screen-recorder" >/dev/null || pgrep -x slurp >/dev/null; then
    ~/.config/hypr/scripts/screenrecord.sh
else
    show_screenrecord_menu
fi
