#!/bin/bash

ubuntuScriptPath=$1

executePrivateInstallScripts() {
    for filePath in ${ubuntuScriptPath}/private/install*.sh; do
        chmod +x "$filePath" # make file executable
        "$filePath"          # execute file
    done
}

echo "# INSTALLING PRIVATE SETUP ..."

./executeInstallScriptsInFolder.sh ${ubuntuScriptPath}/private
status=$?

echo "... FINISHED INSTALLATION OF PRIVATE SETUP #"

exit $status
