#!bin/bash

# Enable RPM Fusion repositories
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Enable VS Code repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Enable Flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Enable docker-ce repository
sudo dnf install dnf-plugins-core

sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Update dnf cache and packages
sudo dnf check-update -y
sudo dnf upgrade -y

# Install RPM based packages
sudo dnf install steam code gnome-tweaks -y

# Install flatpak based packages
flatpak install flathub md.obsidian.Obsidian -y

# Install docker-ce and docker-compose
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose -y

sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"  # Set CGroup to version 1

sudo systemctl start docker
sudo systemctl enable docker

sudo groupadd docker

sudo gpasswd -a ${USER} docker

sudo systemctl restart docker

newgrp docker
