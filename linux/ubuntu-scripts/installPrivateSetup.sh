#!/bin/bash

executePrivateInstallScripts() {
    for filePath in ./private/install*.sh; do
        chmod +x "$filePath" # make file executable
        "$filePath"          # execute file
    done
}

echo "# INSTALLING PRIVATE SETUP ..."

executePrivateInstallScripts
exitStatus = $?

echo "... FINISHED INSTALLATION OF PRIVATE SETUP #"

exitStatus
