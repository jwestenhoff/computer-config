#!/bin/bash

ubuntuScriptPath=$1

echo "# INSTALLING DEV SETUP ..."

# create default folder for projects
mkdir ~/Projects

${ubuntuScriptPath}/executeInstallScriptsInFolder.sh ${ubuntuScriptPath}/dev
status=$?

echo "... FINISHED INSTALLATION OF DEV SETUP #"

exit $status
