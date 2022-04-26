#!/bin/bash

executePrivateInstallScripts() {
    for filePath in ./private/install*.sh; do
        chmod +x "$filePath" # make file executable
        "$filePath"          # execute file
    done

    echo $?
}

echo "# INSTALLING PRIVATE SETUP ..."

status=executePrivateInstallScripts
# status=$?

echo "... FINISHED INSTALLATION OF PRIVATE SETUP #"

exit $status
