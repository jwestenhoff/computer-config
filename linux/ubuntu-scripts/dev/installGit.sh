#!/bin/bash

echo "### INSTALLING GIT ..."

sudo apt install git -y

echo "... FINISHED INSTALLATION OF GIT ###"

echo "### CREATING SSH KEY ..."

# create ssh-key
printf "Hello User,\nPlease insert an e-mail for your ssh-key for git:"
read eMail
echo "Inserted e-mail: $eMail"
ssh-keygen -t ed25519 -C "$eMail" # source: https://docs.github.com/en/github-ae@latest/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

echo "... FINISHED CREATING SSH KEY ###"
