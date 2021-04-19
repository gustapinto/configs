#!bin/bash

# Enable RPM Fusion repositories
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Enable VS Code repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Enable Flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Update dnf cache and packages
sudo dnf check-update -y
sudo dnf upgrade -y

# Install RPM based packages
sudo dnf install steam code docker docker-compose gnome-tweaks -y

# Install flatpak based packages
flatpak install flathub md.obsidian.Obsidian com.spotify.Client -y

# Enable docker groups
sudo usermod -a -G docker $USER

newgrp docker
