#!/bin/bash

if pgrep -f "gpu-screen-recorder" >/dev/null || pgrep -x slurp >/dev/null || pgrep -f "WebcamOverlay" >/dev/null
  echo '{"text": "", "tooltip": "Stop recording", "class": "recording"}'
else
  echo '{"text": ""}'
fi
