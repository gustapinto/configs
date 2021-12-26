#!/bin/bash

# Add third party repositories
sudo apt install -y apt-transport-https
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Update system
sudo apt update && sudo apt upgrade -y

# Install apps
sudo apt install -y \
    docker \
    docker-compose \
    firefox \
    sublime-text \
    neovim

# Configure docker user and group
sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker $USER
newgrp docker

# Active firewall
sudo ufw enable
