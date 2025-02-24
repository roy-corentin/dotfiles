#!/usr/bin/env sh

COMPACTMODE=$(hyprctl getoption general:gaps_out | awk 'NR==1{print $3}')
GAPS_IN=0
GAPS_OUT=0
BORDER_SIZE=0
ROUNDING=0

if [ "$COMPACTMODE" != $GAPS_OUT ] ; then
    hyprctl --batch "keyword general:gaps_in $GAPS_IN;\
                     keyword general:gaps_out $GAPS_OUT;\
                     keyword general:border_size $BORDER_SIZE;\
                     keyword decoration:rounding $ROUNDING;\
                     keyword decoration:rounding_power $ROUNDING;"
  exit
fi
hyprctl reload
