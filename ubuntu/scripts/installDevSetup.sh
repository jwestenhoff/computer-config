#!/bin/bash

# do the following two steps to be able to execute script from everywhere and use relative paths
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

# imports
. "./printHeading.sh" # import print heading function

mkdir ~/Projects

printHeading "install vim"
sudo apt install vim -y
printf "\nexport VISUAL=vim\nexport EDITOR=\"$VISUAL\"\n" >> "$HOME/.bashrc" # configure vim as default editor vor command line

printHeading "install vscode"
sudo snap install --classic code

for filePath in ./dev/install*.sh; do
    chmod +x "$filePath" # make file executable
	"$filePath" # execute file
done
