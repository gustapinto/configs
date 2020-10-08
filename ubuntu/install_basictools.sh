#!/bin/bash

# Add some dependencies
sudo apt install software-properties-common
sudo apt install apt-transport-https wget

# Install things
sudo apt install gufw

# Update system
source ./.update.sh
