#!/bin/bash

echo "### INSTALLING DROPBOX ..."

echo "deb [arch=amd64] http://linux.dropbox.com/ubuntu disco main" | sudo tee /etc/apt/sources.list.d/dropbox.list # Für Version 20.04

sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E

sudo apt update

sudo apt install python3-gpg -y

sudo apt install dropbox -y

echo "... FINISHED INSTALLATION OF DROPBOX ###"
