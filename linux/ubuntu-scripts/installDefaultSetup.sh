#!/bin/bash

ubuntuScriptPath=$1

echo "# INSTALLING DEFAULT SETUP ..."

sudo apt update
sudo apt upgrade -y

# activate minimize to dock
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

${ubuntuScriptPath}/executeInstallScriptsInFolder.sh ${ubuntuScriptPath}/default
status=$?

echo "... FINISHED INSTALLATION OF DEFAULT SETUP #"

exit $status
