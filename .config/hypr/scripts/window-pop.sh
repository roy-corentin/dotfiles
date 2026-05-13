#!/bin/bash

# Toggle to pop-out a tile to stay fixed on a display basis.

# Usage:
# omarchy-hyprland-window-pop [width height [x y]]
#
# Arguments:
#   width   Optional. Width of the floating window. Default: 1300
#   height  Optional. Height of the floating window. Default: 900
#   x       Optional. X position of the window. Must provide both X and Y to take effect.
#   y       Optional. Y position of the window. Must provide both X and Y to take effect.
#
# Behavior:
#   - If the window is already floating, it will be removed from the pop layer.
#   - If the window is not floating, it will be floated, resized, moved/centered, brought to top, and popped.

width=${1:-1276}
height=${2:-750}
x=${3:-}
y=${4:-}

active=$(hyprctl activewindow -j)
floating=$(echo "$active" | jq ".floating")
addr=$(echo "$active" | jq -r ".address")
window="address:$addr"

hypr_dispatch() {
  local lua="$1"
  shift

  hyprctl dispatch "$lua" >/dev/null 2>&1 || hyprctl dispatch "$@" >/dev/null
}

if [[ $floating == "true" ]]; then
  hypr_dispatch "hl.dsp.window.float({ window = \"$window\", action = \"toggle\" })" togglefloating "$window"
  hypr_dispatch "hl.dsp.window.tag({ window = \"$window\", tag = \"-pop\" })" tagwindow -pop "$window"
elif [[ -n $addr ]]; then
  hypr_dispatch "hl.dsp.window.float({ window = \"$window\", action = \"toggle\" })" togglefloating "$window"
  hypr_dispatch "hl.dsp.window.resize({ window = \"$window\", x = $width, y = $height })" resizeactive exact "$width" "$height" "$window"

  if [[ -n $x && -n $y ]]; then
    hypr_dispatch "hl.dsp.window.move({ window = \"$window\", x = $x, y = $y })" moveactive "$x" "$y" "$window"
  else
    hypr_dispatch "hl.dsp.window.center({ window = \"$window\" })" centerwindow "$window"
  fi

  hypr_dispatch "hl.dsp.window.alter_zorder({ window = \"$window\", mode = \"top\" })" alterzorder top "$window"
  hypr_dispatch "hl.dsp.window.tag({ window = \"$window\", tag = \"+pop\" })" tagwindow +pop "$window"
fi
