#!/bin/bash

# Install system requirements for a bunch of stuff
sudo pacman -S base-devel --noconfirm
sudo pacman -S yay --noconfirm
sudo pacman -S vim --noconfirm

# Install some random software that I like :D
sudo pacman -S gufw --noconfirm
yay -S visual-studio-code-bin --noconfirm
yay -S spotify --noconfirm
yay -S discord --noconfirm

# Update the system
source ./.update.sh
