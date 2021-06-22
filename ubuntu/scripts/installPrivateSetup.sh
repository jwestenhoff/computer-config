#!/bin/bash

# do the following two steps to be able to execute script from everywhere and use relative paths
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

# imports
. "./printHeading.sh" # import print heading function

printInstallHeading "telegram desktop"
sudo snap install telegram-desktop

printInstallHeading "discord"
sudo snap install discord
