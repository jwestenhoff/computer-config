#!/bin/bash

ubuntuScriptPath=$1

source ${ubuntuScriptPath}/executeInstallScriptsInFolder.sh

echo "# INSTALLING PRIVATE SETUP ..."

executeInstallScriptsInFolder ${ubuntuScriptPath}/private
status=$?

echo "... FINISHED INSTALLATION OF PRIVATE SETUP #"

exit $status
