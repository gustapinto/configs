#!/bin/bash

echo "Seting up system for? [P]ersonal | [W]ork?"
read ENVIROMENT

echo "Set up dual boot? [Y]es | [No]"
read ENABLE_DUAL_BOOT_INPUT

# Check for the desired enviroment and set app lists
case $ENVIROMENT in
    P | p | Personal | personal)
        echo -n "Setting up system for personal use"

        APT_APPS=(
            code
            docker
            docker-compose
        )

        FLATPAK_APPS=(
            com.spotify.Client
            io.dbeaver.DBeaverCommunity
        )
        ;;

    W | w | Work | work)
        echo -n "Setting up system for work use";

        APT_APPS=(
            code
            docker
            docker-compose
            vim
        )

        FLATPAK_APPS=(
            com.discordapp.Discord
            com.spotify.Client
            io.dbeaver.DBeaverCommunity
            com.discordapp.Discord
            com.getpostman.Postman
        )
        ;;

    *)
        echo "Invalid input try again please"
        exit N
        ;;
esac

# Check for the desired enviroment and set dual boot boolean
case $ENABLE_DUAL_BOOT_INPUT in
    Y | y | Yes | yes)
        echo -n " with dual boot."
        echo ""

        ENABLE_DUAL_BOOT=true
        ;;

    N | n | No | no)
        echo -n " without dual boot."
        echo ""

        ENABLE_DUAL_BOOT=false
        ;;

    *)
        echo "Invalid input try again please"

        exit N
        ;;
esac

# Update system
sudo apt update -y
sudo apt upgrade -y
flatpak update -y

# Install apt based apps
for apt_app in ${APT_APPS[@]}; do
    if ! dpkg -l | grep -q $apt_app; then
        sudo apt install "$apt_app" -y
    else
        echo "[Already installed] - $apt_app"
    fi
done

# Install flatpak based apps
for flatpak_app in ${FLATPAK_APPS[@]}; do
    if ! dpkg -l | grep -q $flatpak_app; then
        flatpak install flathub "$flatpak_app" -y
    else
        echo "[Already installed] - $flatpak_app"
    fi
done

# Create user and group for docker
if dpkg -l | grep -q docker -a dpkg -l | grep -q docker-compose; then
    sudo usermod -aG docker $USER

    newgrp docker
fi

# Active dual boot
if [ $ENABLE_DUAL_BOOT = true ]; then
    if ! dpkg -l | grep -q os-prober; then
        flatpak install apt os-prober -y
    fi

    sudo os-prober

    sudo update-grub
fi

# Remove unnecessary dependencies
sudo apt autoclean -y
sudo apt autoremove -y

flatpak uninstall --unused -y

# Enable firewall
sudo ufw enable

exit 0
