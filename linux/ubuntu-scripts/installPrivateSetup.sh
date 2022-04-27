#!/bin/bash

ubuntuScriptsPath="./linux/ubuntu"

executePrivateInstallScripts() {
    for filePath in ${ubuntuScriptsPath}/private/install*.sh; do
        chmod +x "$filePath" # make file executable
        "$filePath"          # execute file
    done
}

echo "# INSTALLING PRIVATE SETUP ..."

pwd
executePrivateInstallScripts
status=$?

echo "... FINISHED INSTALLATION OF PRIVATE SETUP #"

exit $status
