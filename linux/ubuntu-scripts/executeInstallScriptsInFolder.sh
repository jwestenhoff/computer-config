#!/bin/bash

folderPath=$1

executeInstallScriptsInFolder() {
    for filePath in ${folderPath}/install*.sh; do
        chmod +x "$filePath" # make file executable
        "$filePath"          # execute file
    done
}
export -f executeInstallScriptsInFolder
