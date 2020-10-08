#!/bin/bash

# Import the necessary ppas
source ./.add_ppas.sh

# Install that stuff
sudo apt install code
sudo apt install flameshot

# Update system
source ./.update.sh
