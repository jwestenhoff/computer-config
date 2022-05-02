#!/bin/bash

executeInstallScriptsInFolder() {
    folderPath=$1
    for filePath in ${folderPath}/install*.sh; do
        chmod +x "$filePath" # make file executable
        "$filePath"          # execute file
    done
}
export -f executeInstallScriptsInFolder

executeAptInstalls() {
    aptPackages=("$@")

    for package in "${aptPackages[@]}"; do
        echo "### INSTALLING ${package^^} ..."
        sudo apt install $package
        echo "... FINISHED INSTALLATION OF ${package^^} ###"
    done
}
export -f executeAptInstalls

executeSnapInstalls() {
    snapPackages=("$@")

    for package in "${snapPackages[@]}"; do
        echo "### INSTALLING ${package^^} ..."
        sudo snap install $package
        echo "... FINISHED INSTALLATION OF ${package^^} ###"
    done
}
export -f executeSnapInstalls
