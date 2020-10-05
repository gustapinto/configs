#!/bin/bash

#instalando aplicativos
sudo pacman -S base-devel --noconfirm
sudo pacman -S yay --noconfirm
sudo pacman -S vim --noconfirm
sudo pacman -S flameshot --noconfirm
sudo pacman -S docker --noconfirm
sudo pacman -S docker-compose --noconfirm
sudo pacman -S dbeaver --noconfirm
sudo pacman -S firefox-developer-edition-i18n-pt-br --noconfirm
sudo pacman -S gufw --noconfirm

yay -S visual-studio-code-bin --noconfirm
yay -S spotify --noconfirm
yay -S discord --noconfirm

#atualizando sistema
sudo pacman -Syyu --noconfirm
yay -Syyu --noconfirm

#configurando o docker
sudo usermod -aG docker $USER && newgrp docker
