#!/bin/bash

ubuntuScriptPath=$1
myFolder=private
snapPackages=("discord" "telegram-desktop" "slack")
aptPackages=()
status=0

source ${ubuntuScriptPath}/utilFunctions.sh

echo "# INSTALLING ${myFolder^^} SETUP ..."

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
