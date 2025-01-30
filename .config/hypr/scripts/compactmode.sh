#!/usr/bin/env sh

COMPACTMODE=$(hyprctl getoption general:gaps_out | awk 'NR==1{print $3}')

if [ "$COMPACTMODE" = 4 ] ; then
  hyprctl --batch "keyword general:gaps_out 20;keyword general:gaps_in 12"
  exit
fi
hyprctl reload
