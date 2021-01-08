#!/bin/bash

echo "NON TESTED SCRIPT PLS EDIT IT AFTER TEST AND REMOVE THIS ECHO"

# Update system
sudo pacman -Syyu --noconfirm

# Install pacman based apps
sudo pacman -S vim docker docker-compose --noconfirm

# Enable flatpak
sudo pacman -S flatpak --noconfirm
flatpak update -y

# Install flatpak based apps and crete aliases for them
flatpak install flathub com.discordapp.Discord com.spotify.Client org.libreoffice.LibreOffice io.dbeaver.DBeaverCommunity -y

# Manage apps users and permissions
sudo usermod -aG docker $USER
newgrp docker

# Remove unnecessary dependencies
sudo pacman -Rcns $(pacman -Qdtq)
flatpak uninstall --unused -y

# Enable firewall
sudo ufw enable
