#!/bin/bash

# Add third party repositories
sudo apt install -y apt-transport-https
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update

# Update system
sudo apt upgrade

# Install apps
sudo apt install -y \
    docker \
    docker-compose \
    google-chrome-stable \
    steam \
    sublime-text \
    vim
flatpak install -y \
    flathub md.obsidian.Obsidian

# Configure docker user and group
sudo usermod -aG docker $USER
newgrp docker

# Active firewall
sudo ufw enable
