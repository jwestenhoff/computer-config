#!/bin/bash

ubuntuScriptPath=$1
myFolder=private
snapPackages=("discord" "telegram-desktop" "slack --classic")
aptPackages=()

source ${ubuntuScriptPath}/utilFunctions.sh

echo "# INSTALLING ${myFolder^^} SETUP ..."

executeSnapInstalls "${snapPackages[@]}"

executeAptInstalls "${aptPackages[@]}"

executeInstallScriptsInFolder ${ubuntuScriptPath}/$myFolder
status=$?

echo "... FINISHED INSTALLATION OF ${myFolder^^} SETUP #"

exit $status
