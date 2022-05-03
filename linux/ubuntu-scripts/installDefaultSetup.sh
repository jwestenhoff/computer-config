#!/bin/bash

ubuntuScriptPath=$1
myFolder=default
snapPackages=("brave" "spotify" "libreoffice")
aptPackages=("vlc")
status=0

source ${ubuntuScriptPath}/utilFunctions.sh

echo "# INSTALLING ${myFolder^^} SETUP ..."

sudo apt update
sudo apt upgrade -y

# activate minimize to dock
# (jenkins has no user interface -> always exit != 0 -> status not tracked)
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

if [[ $status == 0 ]]; then
    executeSnapInstalls "${snapPackages[@]}"
    status=$?
fi

if [[ $status == 0 ]]; then
    executeAptInstalls "${aptPackages[@]}"
    status=$?
fi

if [[ $status == 0 ]]; then
    executeInstallScriptsInFolder ${ubuntuScriptPath}/$myFolder
    status=$?
fi

echo "... FINISHED INSTALLATION OF ${myFolder^^} SETUP #"

exit $status
