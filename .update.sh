#!/bin/bash

# Updates apt based apps
sudo apt update &&
sudo apt upgrade &&

# Update snap based apps
sudo snap refresh

# Close terminal
# exit
