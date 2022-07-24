#!bin/bash

# Speed up dnf
dnf_config=/etc/dnf/dnf.conf

sudo chown $USER:$USER $dnf_config

echo "max_parallel_downloads=10" >> $dnf_config
echo "fastestmirror=True" >> $dnf_config

sudo chown root:root $dnf_config

# Enable RPM Fusion repositories
sudo dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Enable third party repositories
sudo dnf install -y dnf-plugins-core
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Update dnf cache and packages
sudo dnf check-update -y
sudo dnf upgrade -y

# Install RPM based packages
sudo dnf install -y \
    moby-engine \
    docker-compose \
    neofetch \
    vim \
    code

# Install flatpak based packages
flatpak install flathub -y \
    md.obsidian.Obsidian \
    com.spotify.Client

# Remove Fedora bloat
sudo dnf remove -y \
    cheese \
    gnome-boxes \
    gnome-clocks \
    gnome-contacts \
    gnome-maps \
    gnome-tour \
    gnome-weather \
    simple-scan \
    yelp

# Remove possible unused packages
sudo dnf autoremove -y
flatpak remove --unused -y

# Enable and set docker-ce permissions
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker $USER

# Configure sublime text settings
cp ../editors/Preferences.sublime-settings \
    ~/.config/sublime-text/Packages/User/Preferences.sublime-settings

# Generate ssh key
ssh-keygen -t rsa -b 4096
