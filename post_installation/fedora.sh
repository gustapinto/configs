#!bin/bash

# Enable RPM Fusion repositories
sudo dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Enable third party repositories
sudo dnf install -y dnf-plugins-core
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Update dnf cache and packages
sudo dnf check-update -y
sudo dnf upgrade -y

# Install RPM based packages
sudo dnf install -y \
    containerd.io \
    docker-ce \
    docker-ce-cli \
    docker-compose \
    gnome-tweaks \
    sublime-text

# Install flatpak based packages
flatpak install -y \
    flathub md.obsidian.Obsidian

# Remove Fedora bloat
sudo dnf remove -y \
    cheese \
    gnome-boxes \
    gnome-clocks \
    gnome-contacts \
    gnome-maps \
    gnome-tour \
    gnome-weather \
    libreoffice-* \
    simple-scan \
    yelp

# Remove possible unused packages
sudo dnf autoremove -y
flatpak remove --unused -y

# Set CGroup to version 1
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"

# Enable and set docker-ce permissions
sudo systemctl start docker
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo systemctl restart docker
newgrp docker
