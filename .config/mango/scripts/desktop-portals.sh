#!/usr/bin/env bash

# Make the Wayland session available to D-Bus/systemd-activated services.
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP

# Portals are D-Bus activated; do not launch or kill their processes manually.
