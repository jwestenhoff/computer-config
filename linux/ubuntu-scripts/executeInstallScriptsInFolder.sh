#!/bin/bash

executeInstallScriptsInFolder() {
    folderPath=$1
    for filePath in ${folderPath}/install*.sh; do
        chmod +x "$filePath" # make file executable
        "$filePath"          # execute file
    done
}
export -f executeInstallScriptsInFolder
