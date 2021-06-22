#!/bin/bash

mkdir ~/Projects

echo "### INSTALL VIM ###"
sudo apt install vim -y
printf "\nexport VISUAL=vim\nexport EDITOR=\"$VISUAL\"\n" >> "$HOME/.bashrc" # configure vim as default editor vor command line

echo "### INSTALL VSCode ###"
sudo snap install --classic code

for filePath in ./dev/install*.sh; do
    chmod +x "$filePath" # make file executable
	"$filePath" # execute file
done
