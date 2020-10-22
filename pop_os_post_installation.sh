#!/bin/bash

# Update system
sudo apt update -y
sudo apt upgrade -y
flatpak update -y

# Check for another OS on system and active dual boot if necessary
sudo apt install os-prober -y
sudo os-prober
sudo update-grub

# Install apt based apps
sudo apt install docker docker-compose -y

# Install flatpak based apps and crete aliases for them
flatpak install flathub org.vim.Vim com.visualstudio.code flathub com.discordapp.Discord com.spotify.Client org.libreoffice.LibreOffice org.videolan.VLC io.dbeaver.DBeaverCommunity -y

echo "alias code='flatpak run com.visualstudio.code'" >> ~/.bashrc
echo "alias vim='flatpak run org.vim.Vim'" >> ~/.bashrc
source ~/.bashrc

# Manage apps users and permissions
sudo usermod -aG docker $USER
newgrp docker

# Remove bloatware or duplicated apps
sudo apt remove --purge libreoffice-core -y
sudo apt remove --purge geary -y

# Remove unnecessary dependencies
sudo apt autoclean -y
sudo apt autoremove -y
flatpak uninstall --unused -y
