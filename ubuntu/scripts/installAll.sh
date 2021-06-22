#!/bin/bash

# do the following two steps to be able to execute script from everywhere and use relative paths
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

# imports
. "./printHeading.sh" # import print heading function

pathOfThisFile="./installAll.sh"
pathOfPrivateSetupFile="./installPrivateSetup.sh"
nonePrivate=false

OTHER_ARGUMENTS=()

printf "\nRead and process arguments..."
for arg in "$@"; do
  case $arg in
  -np | --none-private)
    nonePrivate=true
    shift # Remove argument from processing
    ;;
  *)
    OTHER_ARGUMENTS+=("$1")
    shift # Remove argument from processing
    ;;
  esac
done
echo ""

printHeading "trigger installing scripts"
echo " - none-private: $nonePrivate"
echo " - other arguments: ${OTHER_ARGUMENTS[*]}"
echo ""

for filePath in ./install*.sh; do
    notPrivateSetupAndIsPrivateSetupFile=(nonePrivate && $filePath == $pathOfPrivateSetupFile)

    if [ $filePath != $pathOfThisFile && !(notPrivateSetupAndIsPrivateSetupFile) ]
    then
        chmod +x "$filePath" # make file executable
	    "$filePath" # execute file
    fi
done
