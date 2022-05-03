#!/bin/bash

executeInstallScriptsInFolder() {
    folderPath=$1
    status=0

    for filePath in ${folderPath}/install*.sh; do
        chmod +x "$filePath" # make file executable

        "$filePath" # execute file
        status=$?

        if [[ $status != 0 ]]; then
            exit $status
        fi
    done
}
export -f executeInstallScriptsInFolder

executeAptInstalls() {
    aptPackages=("$@")
    status=0

    for package in "${aptPackages[@]}"; do
        echo "### INSTALLING ${package^^} ..."

        sudo apt install $package -y
        status=$?

        echo "... FINISHED INSTALLATION OF ${package^^} ###"

        if [[ $status != 0 ]]; then
            exit $status
        fi
    done
}
export -f executeAptInstalls

executeSnapInstalls() {
    snapPackages=("$@")
    status=0

    for package in "${snapPackages[@]}"; do
        echo "### INSTALLING ${package^^} ..."

        sudo snap install $package
        status=$?

        echo "... FINISHED INSTALLATION OF ${package^^} ###"

        if [[ $status != 0 ]]; then
            exit $status
        fi
    done
}
export -f executeSnapInstalls
