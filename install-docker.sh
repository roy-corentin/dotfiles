#!/usr/bin/env bash

yay -S docker docker-compose schemaspy podman

usermod -aG docker $USER

sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl status docker.service
