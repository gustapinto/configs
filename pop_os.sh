#!/bin/bash

# Update system
sudo apt update -y
sudo apt upgrade -y
flatpak update -y

# Install apt based apps
sudo apt install os-prober docker docker-compose code vim -y

# Check for another OS on system and active dual boot if necessary
sudo os-prober
sudo update-grub

# Install flatpak based apps and crete aliases for them
flatpak install flathub com.discordapp.Discord com.spotify.Client org.libreoffice.LibreOffice io.dbeaver.DBeaverCommunity -y

# Manage apps users and permissions
sudo usermod -aG docker $USER
newgrp docker

# Remove bloatware or duplicated apps
sudo apt remove --purge libreoffice-core geary -y

# Remove unnecessary dependencies
sudo apt autoclean -y
sudo apt autoremove -y
flatpak uninstall --unused -y

# Enable firewall
sudo ufw enable

# To enable Wayland compositor comment the WaylandEnable=false line
sudo nano /etc/gdm3/custom.conf
