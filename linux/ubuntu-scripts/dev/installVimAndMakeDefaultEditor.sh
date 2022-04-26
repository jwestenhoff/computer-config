#!/bin/bash

echo "### INSTALLING VIM ..."

sudo apt install vim -y
printf "\nexport VISUAL=vim\nexport EDITOR=\"$VISUAL\"\n" >>"$HOME/.bashrc" # configure vim as default editor vor command line

echo "... FINISHED INSTALLATION OF VIM ###"
