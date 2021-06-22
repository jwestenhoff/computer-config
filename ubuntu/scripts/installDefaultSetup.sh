#!/bin/bash

echo "### UPDATE AND UPGRADE INSTALLED PACKAGES"
sudo apt update
sudo apt upgrade -y

echo "### INSTALL PACKAGES FOR VIDEO WATCHING ###"
sudo apt install ubuntu-restricted-extras -y
sudo apt install libdvd-pkg -y
sudo dpkg-reconfigure libdvd-pkg

echo "### ACTIVATE MINIMIZE TO DOCK ###"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

for filePath in ./default/install*.sh; do
    chmod +x "$filePath" # make file executable
	"$filePath" # execute file
done
