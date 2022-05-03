#!/bin/bash

# source: https://yallalabs.com/linux/how-to-install-microsoft-teams-ubuntu-20-04/

echo "### INSTALLING TEAMS ..."

sudo curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'

if [[ $status == 0 ]]; then
    sudo apt update
    status=$?
fi

sudo apt install teams -y

echo "... FINISHED INSTALLATION OF TEAMS ###"
