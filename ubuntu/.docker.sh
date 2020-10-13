#!/bin/bash

# Install docker
sudo apt install docker docker-compose

# Configure permissions
sudo usermod -aG docker $USER && newgrp docker

# Update system
source ./.update.sh
