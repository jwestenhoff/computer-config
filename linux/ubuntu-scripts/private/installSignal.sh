#!/bin/bash

# source: https://itsfoss.com/install-signal-ubuntu/

echo "### INSTALLING SIGNAL ..."

wget -O- https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -

echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

if [[ $status == 0 ]]; then
    sudo apt update
    status=$?
fi

sudo apt install signal-desktop -y

echo "... FINISHED INSTALLATION OF SIGNAL ###"
