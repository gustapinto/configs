#!\bin\bash

sudo dnf remove -y \
    gnome-photos \
    gnome-videos \
    gnome-maps \
    cheese \
    gnome-tour \
    simple-scan

sudo dnf autoremove -y
