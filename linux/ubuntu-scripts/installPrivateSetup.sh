#!/bin/bash

executePrivateInstallScripts() {
    for filePath in ./private/install*.sh; do
        chmod +x "$filePath" # make file executable
        "$filePath"          # execute file
    done
}

echo "# INSTALLING PRIVATE SETUP ..."

result = executePrivateInstallScripts

echo "... FINISHED INSTALLATION OF PRIVATE SETUP #"

result
