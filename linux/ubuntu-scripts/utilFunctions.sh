#!/bin/bash

executeInstallScriptsInFolder() {
    folderPath=$1
    for filePath in ${folderPath}/install*.sh; do
        chmod +x "$filePath" # make file executable
        "$filePath"          # execute file
    done
}
export -f executeInstallScriptsInFolder

executeSnapInstalls() {
    package=$1
    echo "### INSTALLING ${package^^} ..."
    sudo snap install $package
    echo "... FINISHED INSTALLATION OF ${package^^} ###"
}
export -f executeSnapInstalls
