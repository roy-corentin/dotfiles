#!/usr/bin/env bash

DIR="/home/croy/Videos/screen-capture"

# Check whether to start or stop the recording (if wf-recorder is running)
if [ -f /tmp/wf-recorder.pid ] && [ -f /tmp/wf-recorder.timestamp ]; then
    # Read the PID and timestamp of wf-recorder
    pid=$(cat /tmp/wf-recorder.pid)
    timestamp=$(cat /tmp/wf-recorder.timestamp)
    kill $pid
    rm /tmp/wf-recorder.pid /tmp/wf-recorder.timestamp

    # Send a notification
    notify-send "Recording Finished"
else
    # Generate a timestamp
    timestamp=$(date +"%Y%m%d_%H%M%S")

    # Create output dir if not exists
    mkdir -p $DIR

    # Start recording with wf-recorder and save to a file with the timestamp
    wf-recorder -g "$(slurp)" -f "$DIR/recording_${timestamp}.gif" -c gif &

    # Save the PID of wf-recorder and the timestamp
    echo $! > /tmp/wf-recorder.pid
    echo $timestamp > /tmp/wf-recorder.timestamp

    # Send a notification
    notify-send "Recording Started" \
                "Saved to $DIR/recording_${timestamp}.mkv"
fi
