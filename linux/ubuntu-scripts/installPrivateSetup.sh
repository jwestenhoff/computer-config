#!/bin/bash

ubuntuScriptPath=$1

echo "# INSTALLING PRIVATE SETUP ..."

${ubuntuScriptPath}/executeInstallScriptsInFolder.sh ${ubuntuScriptPath}/private
status=$?

echo "... FINISHED INSTALLATION OF PRIVATE SETUP #"

exit $status
