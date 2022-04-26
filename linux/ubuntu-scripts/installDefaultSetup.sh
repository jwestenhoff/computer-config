#!/bin/bash

echo "# INSTALLING DEFAULT SETUP ..."

sudo apt update
sudo apt upgrade -y

# activate minimize to dock
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# execute default install scripts
for filePath in ./default/install*.sh; do
    chmod +x "$filePath" # make file executable
    $filePath            # execute file
done

echo "... FINISHED INSTALLATION OF DEFAULT SETUP #"
