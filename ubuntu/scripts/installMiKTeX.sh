#!/bin/bash

# do the following two steps to be able to execute script from everywhere and use relative paths
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

# imports
. "./printHeading.sh" # import print heading function

printHeading "start MiKTeX installation"
printHeading "register gpg key"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889

printHeading "register installation source"
echo "deb http://miktex.org/download/ubuntu focal universe" | sudo tee /etc/apt/sources.list.d/miktex.list # Für Version 20.04

printHeading "install MiKTeX"
sudo apt update
sudo apt install miktex

printHeading "starting MikTex setup"
miktexsetup
