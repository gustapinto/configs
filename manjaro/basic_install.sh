#! /bin/bash

#instalando aplicativos
sudo pacman -S base-devel
sudo pacman -S yay
sudo pacman -S vim
sudo pacman -S docker
sudo pacman -S docker-compose
yay -S spotify --noconfirm
yay -S google-chrome --noconfirm
yay -S discord --noconfirm

sudo pacman -Syu
yay -Syyu --noconfirm

#removendo apps inuteis
sudo pacman -R firefox
sudo pacman -R thunderbird

#configurando o docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER && newgrp docker
