#!/bin/bash
# purpose:  installs spotify
# source:   https://www.spotify.com/us/download/linux/

# do the following two steps to be able to execute script from everywhere and use relative paths
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

# imports
. "../printHeading.sh" # import print heading function

printInstallHeading "spotify client"
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get update

sudo apt-get install spotify-client -y
