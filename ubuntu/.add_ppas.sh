#!/bin/bash

# Adds a LOT OF PPAS AAAAAAAAAAAAAAAAAAAAAAAAAAaa

# Microsoft Stuff
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"