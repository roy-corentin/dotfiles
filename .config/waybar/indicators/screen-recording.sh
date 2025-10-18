#!/bin/bash

if pgrep -f "gpu-screen-recorder" >/dev/null; then
  echo '{"text": "", "tooltip": "Stop recording", "class": "recording"}'
else
  echo '{"text": ""}'
fi
