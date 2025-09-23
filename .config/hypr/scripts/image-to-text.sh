#! /usr/bin/env bash

grim -g "$(slurp -d -c D1E5F4BB -b 1B232866 -s 00000000)" "tmp.png" && tesseract "tmp.png" - | wl-copy && rm "tmp.png"
