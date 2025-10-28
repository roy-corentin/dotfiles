#!/usr/bin/env sh

GAPSOUT=$(hyprctl getoption general:gaps_out | awk 'NR==1{print $3}')
COMPACTED_GAPS_IN=0
COMPACTED_GAPS_OUT=0
COMPACTED_BORDER_SIZE=1
COMPACTED_ROUNDING=0

if [ "$GAPSOUT" != $COMPACTED_GAPS_OUT ] ; then
    hyprctl --batch "keyword general:gaps_in $COMPACTED_GAPS_IN;\
                     keyword general:gaps_out $COMPACTED_GAPS_OUT;\
                     keyword general:border_size $COMPACTED_BORDER_SIZE;\
                     keyword decoration:rounding $COMPACTED_ROUNDING;\
                     keyword decoration:rounding_power $COMPACTED_ROUNDING;"
else
    hyprctl reload
fi
