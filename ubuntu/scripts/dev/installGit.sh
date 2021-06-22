#!/bin/bash

# do the following two steps to be able to execute script from everywhere and use relative paths
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

# imports
. "../printHeading.sh" # import print heading function

printInstallHeading "git"
sudo apt install git -y # add hint to add global config (mail and user name)

printHeading "create ssh-key"
echo "Hello User\nPlease insert an e-mail for your ssh-key for git:"
read eMail
echo "Inserted e-mail: $eMail"

ssh-keygen -t ed25519 -C "$eMail" # source: https://docs.github.com/en/github-ae@latest/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
