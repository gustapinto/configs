#!/bin/bash

#instalando aplicativos
sudo pacman -S base-devel --noconfirm
sudo pacman -S yay --noconfirm
sudo pacman -S vim --noconfirm
sudo pacman -S docker --noconfirm
sudo pacman -S docker-compose --noconfirm
yay -S spotify --noconfirm
yay -S google-chrome --noconfirm
yay -S discord --noconfirm

sudo pacman -Syyu --noconfirm
yay -Syyu --noconfirm

#configurando o docker
sudo usermod -aG docker $USER && newgrp docker
