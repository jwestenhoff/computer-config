#!/bin/bash

echo "\n### INSTALL GIT ###"
sudo apt install git -y # add hint to add global config (mail and user name)

echo "### CREATE SSH-KEY ###"
echo "Hello User\nPlease insert an e-mail for your ssh-key for git:"
read eMail
echo "Inserted e-mail: $eMail"

ssh-keygen -t ed25519 -C "$eMail" # source: https://docs.github.com/en/github-ae@latest/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
