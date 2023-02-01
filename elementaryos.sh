#!/bin/bash

# Add external repositories
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:philip.scott/pantheon-tweaks

# Install software and prerequesites
sudo apt update

sudo apt install -y \
    curl \
    wget \
    vim \
    zsh \
    pantheon-tweaks \
    fonts-liberation \
    docker \
    docker-compose

# Install external installer based software
wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O /tmp/vscode.deb && \
    sudo dpkg -i /tmp/vscode.deb
wget "https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb" -O /tmp/dbeaver.deb && \
    sudo dpkg -i /tmp/dbeaver.deb
wget "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.1.9/obsidian_1.1.9_amd64.deb" -O /tmp/obsidian.deb && \
    sudo dpkg -i /tmp/obsidian.deb
wget "https://updates.insomnia.rest/downloads/ubuntu/latest?&app=com.insomnia.app&source=website" -O /tmp/insomnia.deb && \
    sudo dpkg -i /tmp/insomnia.deb

# Install Oh My Zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Cleanup
sudo apt autoremove

# Configure docker
sudo systemctl start docker && \
    sudo systemctl enable docker && \
    sudo usermod -aG docker $USER && \
    newgrp docker

# Configure dotfiles
cp .zshrc ~/.zshrc
