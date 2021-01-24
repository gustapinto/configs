#!/bin/bash

echo "Seting up system for? [P]ersonal | [W]ork?"
read ENVIROMENT

# Check for tehe desired enviroment and set app lists
case $ENVIROMENT in
    P | p | Personal | personal)
        echo "Setting up system for personal use ..."
        echo ""

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
        echo "Setting up system for work use ...";
        echo ""

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
        echo "Invalid input try again please."

        INVALID_INPUT_ERROR=true

        return
        ;;
esac

echo "Set up multi boot? [Y]es | [No]"
read ENABLE_MULTI_BOOT_INPUT

# Check and set the multi boot option
case $ENABLE_MULTI_BOOT_INPUT in
    Y | y | Yes | yes)
        echo " Setting up system with multi boot ..."
        echo ""

        ENABLE_MULTI_BOOT=true
        ;;

    N | n | No | no)
        echo "Setting up system with single boot ..."
        echo ""

        ENABLE_MULTI_BOOT=false
        ;;

    *)
        echo "Invalid input try again please."

        INVALID_INPUT_ERROR=true

        return
        ;;
esac

if [ "$INVALID_INPUT_ERROR" = false ]; then
    # Update system
    sudo apt update -y
    sudo apt upgrade -y
    flatpak update -y

    # Install apt based apps
    for apt_app in ${APT_APPS[@]}; do
        if ! dpkg -l | grep -q $apt_app; then
            sudo apt install "$apt_app" -y

            if [ "$apt_app" == "docker" ]; then
                # Create user and group for docker
                sudo usermod -aG docker $USER

                newgrp docker
            fi
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

    # Active multi boot
    if [ "$ENABLE_MULTI_BOOT" = true ]; then
        if ! dpkg -l | grep -q os-prober; then
            flatpak install apt os-prober -y
        fi

        sudo os-prober

        sudo update-grub

        # Fix datetime errors on windows and unix on multi boot
        timedatectl set-local-rtc 1 --adjust-system-clock
    fi

    # Remove unnecessary dependencies
    sudo apt autoclean -y
    sudo apt autoremove -y

    flatpak uninstall --unused -y

    # Enable firewall
    sudo ufw enable
fi
