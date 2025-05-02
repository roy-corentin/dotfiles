#!/usr/bin/env bash

echo "Install kanata"

yay -S kanata

# If the uinput group does not exist, create anew group
sudo groupadd uinput

# Add your user to the input and the uniput group
sudo usermod -aG iput $USER
sudo usermod -aG uiput $USER

# Make sure th uinput device file has the right permissions.
echo "KERNEL=='uinput', MODE='0660', GROUP='uinput', OPTIONS+='static_node=uinput'" | sudo tee /etc/udev/rules.d/99-input.rules
sudo udevadm control --reload-rules && sudo udevadm trigger
sudo modprobe uinput

# Make sure the uinput drivers are loaded
systemctl --user daemon-reload
systemctl --user enable kanata.service
systemctl --user start kanata.service
systemctl --user status kanata.service   # check whether the service is running
