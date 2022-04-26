#!/bin/bash

echo "### INSTALLING PACKAGES FOR VIDEOWATCHING ..."

sudo apt install ubuntu-restricted-extras -y
sudo apt install libdvd-pkg -y
sudo dpkg-reconfigure libdvd-pkg

echo "... FINISHED INSTALLATION OF PACKAGES FOR VIDEOWATCHING ###"
