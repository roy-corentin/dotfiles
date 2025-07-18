#!/usr/bin/env bash

yay -S fprintd

echo -e "\e[32m\nLet's setup your right index finger as the first fingerprint.\nKeep moving the finger around on sensor until the process completes.\n\e[0m"
fprintd-enroll

echo -e "\e[32m\nNow let's verify that it's working correctly.\e[0m\n"

if fprintd-verify; then
  echo -e "\e[32m\nPerfect! Now you can use your fingerprint on the lock screen (Super + Escape).\e[0m"
else
  echo -e "\e[31m\nSomething went wrong. Maybe try again?\e[0m"
fi
