#!/bin/bash

echo "NON TESTED SCRIPT PLS EDIT IT AFTER TEST AND REMOVE THIS ECHO"

# Update system
sudo pacman -Syyu --noconfirm

# Install pacman based apps
sudo pacman -S docker docker-compose flameshot --noconfirm

# Enable flatpak
sudo pacman -S flatpak
flatpak update -y

# Install flatpak based apps and crete aliases for them
flatpak install flathub org.vim.Vim com.visualstudio.code flathub com.discordapp.Discord com.spotify.Client org.libreoffice.LibreOffice org.videolan.VLC io.dbeaver.DBeaverCommunity -y

echo "alias code='flatpak run com.visualstudio.code'" >> ~/.bashrc
echo "alias vim='flatpak run org.vim.Vim'" >> ~/.bashrc
source ~/.bashrc

# Manage apps users and permissions
sudo usermod -aG docker $USER
newgrp docker

# Remove unnecessary dependencies
sudo pacman -Rcns $(pacman -Qdtq)
flatpak uninstall --unused -y

# Enable firewall
sudo ufw enable

# Configure git to use flatpak vim as editor
git config --global core.editor "flatpak run org.vim.Vim"
