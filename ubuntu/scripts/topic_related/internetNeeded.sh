#!/bin/bash

echo "### UPDATE AND UPGRADE INSTALLED PACKAGES"
sudo apt update
sudo apt upgrade -y
echo ""

# packages for watching videos and dvds
sudo apt install ubuntu-restricted-extras -y
sudo apt install libdvd-pkg -y
sudo dpkg-reconfigure libdvd-pkg