#!/bin/bash

# Install some developer tools
sudo pacman -S flameshot --noconfirm
sudo pacman -S docker --noconfirm
sudo pacman -S docker-compose --noconfirm
sudo pacman -S dbeaver --noconfirm
sudo pacman -S firefox-developer-edition-i18n-pt-br --noconfirm

# Configure docker groups
sudo usermod -aG docker $USER && newgrp docker

# Update the system
source ./.update.sh
