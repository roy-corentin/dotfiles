#!/usr/bin/env bash

MESSAGE="Plug in a charger ASAP!"
PERC_LIMIT=20

BATTERY="BAT0"
BATTERYPATH="/sys/class/power_supply/$BATTERY"

FULL=$(/usr/bin/cat $BATTERYPATH/charge_full)
REM=$(/usr/bin/cat $BATTERYPATH/charge_now)
STAT=$(/usr/bin/cat $BATTERYPATH/status)

PERC=$(((REM * 100) / FULL))

# If not charging and battery is below percentage limit defined above, then send notification
if [ "$STAT" != "Charging" ] && [ $PERC -le $PERC_LIMIT ]; then
    /usr/bin/notify-send -i battery-empty -u critical -a "system" "Low battery! $MESSAGE"
fi
