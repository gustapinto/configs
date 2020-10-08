#!/bin/bash

# Updates apt based apps
sudo apt update &&
sudo apt upgrade &&

# Update snap based apps
sudo snap refresh

# Clear the necessary cache
source ./.clear_cache.sh
