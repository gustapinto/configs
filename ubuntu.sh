#!/bin/bash

# Add external repositories
sudo add-apt-repository ppa:aslatter/ppa

# Install software and prerequesites
sudo apt update && sudo apt upgrade -y

sudo apt install -y \
    alacritty \
    curl \
    docker \
    docker-compose \
    tmux \
    vim \
    zsh

# Install .deb based software
wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O /tmp/vscode.deb && sudo dpkg -i /tmp/vscode.deb
wget "https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb" -O /tmp/dbeaver.deb && sudo dpkg -i /tmp/dbeaver.deb
wget "https://github.com/obsidianmd/obsidian-releases/releases/download/v0.15.9/obsidian_0.15.9_amd64.deb" -O /tmp/obsidian.deb && sudo dpkg -i /tmp/obsidian.deb

# Install Oh My Zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Configure docker
sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker $USER
newgrp docker

# Configure dotfiles
cp .alacritty.yml ~/.alacritty.yml
cp .tmux.conf ~/.tmux.conf
cp .vimrc ~/.vimrc
cp .zsh_aliases ~/.zsh_aliases && echo "source ~/.zsh_aliases" >> ~/.zshrc
