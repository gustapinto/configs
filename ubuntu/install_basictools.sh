#!/bin/bash

# Add some dependencies
sudo apt install software-properties-common
sudo apt install apt-transport-https wget

# Install non flatpak things
sudo apt install gufw
sudo apt install vim
sudo apt install flameshot

# Docker :D
source ./.docker.sh

# Update system
source ./.update.sh
