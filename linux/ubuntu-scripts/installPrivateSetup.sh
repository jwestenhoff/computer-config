#!/bin/bash

ubuntuScriptPath=$1
myFolder=private
snapPackages=("discord" "telegram-desktop" "slack --classic")
aptPackages=()
status=0

source ${ubuntuScriptPath}/utilFunctions.sh

echo "# INSTALLING ${myFolder^^} SETUP ..."

if [[ $status == 0 ]]; then
    executeSnapInstalls "${snapPackages[@]}"
    status=127
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
