#!/bin/bash

# imports
. "./printHeading.sh" # import print heading function

printHeading "upgrade packages"
sudo apt update
sudo apt upgrade -y

printInstallHeading "packages for video watching"
sudo apt install ubuntu-restricted-extras -y
sudo apt install libdvd-pkg -y
sudo dpkg-reconfigure libdvd-pkg

printHeading "activate minimize to dock"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

for filePath in ./default/install*.sh; do
    chmod +x "$filePath" # make file executable
	"$filePath" # execute file
done
