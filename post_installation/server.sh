#!/bin/bash

# Install software and prerequesites
sudo apt update && sudo apt upgrade -y

sudo apt install -y \
    docker \
    docker-compose \
    nginx

# Configure docker
sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker $USER
newgrp docker

