#!/bin/bash

ubuntuScriptPath=$1
myFolder=default

source ${ubuntuScriptPath}/utilFunctions.sh

echo "# INSTALLING ${myFolder^^} SETUP ..."

sudo apt update
sudo apt upgrade -y

# activate minimize to dock
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

executeInstallScriptsInFolder ${ubuntuScriptPath}/$myFolder
status=$?

echo "... FINISHED INSTALLATION OF ${myFolder^^} SETUP #"

exit $status
