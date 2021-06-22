#!/bin/bash

echo ""
echo "Register gpg key"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889

echo ""
echo "register installation source"
echo "deb http://miktex.org/download/ubuntu focal universe" | sudo tee /etc/apt/sources.list.d/miktex.list # Für Version 20.04

echo ""
echo "Install MiKTeX"
sudo apt update
sudo apt install miktex

echo ""
echo "Start MikTex setup"
miktexsetup