#!/bin/bash

# Clean apt based cache
sudo apt autoremove &&
sudo apt clean &&
sudo apt autoclean

# Clean snap based cache, tnx to Alan Pope for the script
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done

# Close terminal
exit
