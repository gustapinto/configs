#!/bin/bash

# Add current user to sudoers
touch "/etc/sudoers.d/sudoer_gustavo"
cat <<EOF > "/etc/sudoers.d/sudoer_gustavo"
gustavo ALL=(ALL) NOPASSWD: ALL
EOF

# Install software and prerequesites
sudo apt update && sudo apt install -y \
    curl \
    docker \
    docker-compose \
    tmux \
    vim \
    zsh \
    wget \
    gnome-calendar \
    fonts-liberation \
    libu2f-udev \
    python3-pip

# Install external installer based software
wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O /tmp/vscode.deb && \
    sudo dpkg -i /tmp/vscode.deb
wget "https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb" -O /tmp/dbeaver.deb && \
    sudo dpkg -i /tmp/dbeaver.deb
wget "https://updates.insomnia.rest/downloads/ubuntu/latest?&app=com.insomnia.app&source=website" -O /tmp/insomnia.deb && \
    sudo dpkg -i /tmp/insomnia.deb
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -O /tmp/google-chrome-stable.deb && \
    sudo dpkg -i /tmp/google-chrome-stable.deb	

# Install Oh My Zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Cleanup
sudo apt autoremove

# Configure docker
sudo systemctl start docker && \
    sudo systemctl enable docker && \
    sudo usermod -aG docker gustavo && \
    newgrp docker

# Configure dotfiles
cp ./.zshrc /home/gustavo/.zshrc
cp ./.tmux.conf /home/gustavo/.tmux.conf
cp ./.vimrc /home/gustavo/.vimrc
