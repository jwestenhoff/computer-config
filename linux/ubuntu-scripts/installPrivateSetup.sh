#!/bin/bash

ubuntuScriptPath=$1
myFolder=private

source ${ubuntuScriptPath}/utilFunctions.sh

echo "# INSTALLING ${myFolder^^} SETUP ..."

executeInstallScriptsInFolder ${ubuntuScriptPath}/$myFolder
status=$?

echo "... FINISHED INSTALLATION OF ${myFolder^^} SETUP #"

exit $status
