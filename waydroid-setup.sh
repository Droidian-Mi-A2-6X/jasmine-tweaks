#!/bin/bash

echo "Instructions copied from https://docs.waydro.id/usage/install-on-desktops"

sudo apt update && sudo apt install curl ca-certificates -y

# Setting up waydroid repo

export DISTRO="bullseye" && sudo curl -# --proto '=https' --tlsv1.2 -Sf https://repo.waydro.id/waydroid.gpg --output /usr/share/keyrings/waydroid.gpg && echo "deb [signed-by=/usr/share/keyrings/waydroid.gpg] https://repo.waydro.id/ $DISTRO main" > ~/waydroid.list && sudo mv ~/waydroid.list /etc/apt/sources.list.d/waydroid.list && echo "Updating system..." && sudo apt update && sudo apt dist-upgrade -y

echo "Installing waydroid package ..."

sudo apt install waydroid -y && echo "Waydroid init ..." && sudo waydroid init -c https://waydroid.bardia.tech/OTA/system -v https://waydroid.bardia.tech/OTA/vendor -s GAPPS

echo "Rebooting now..."

sleep 5

sudo reboot
