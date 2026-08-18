#!/usr/bin/env bash

yay -S docker docker-compose schemaspy podman docker-buildx

sudo systemctl enable --now docker.service

sudo usermod -aG docker "$USER"

echo "Need to logout to be able to use docker"
