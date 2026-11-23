#!/usr/bin/env bash

cliphist list | vicinae dmenu -p "" | cliphist decode | wl-copy
