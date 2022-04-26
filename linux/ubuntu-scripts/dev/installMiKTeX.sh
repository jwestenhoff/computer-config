#!/bin/bash

echo "### INSTALLING MIKTEX ..."

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889

echo "deb [arch=amd64] http://miktex.org/download/ubuntu focal universe" | sudo tee /etc/apt/sources.list.d/miktex.list # Für Version 20.04

sudo apt update

sudo apt install miktex -y

miktexsetup

echo "... FINISHED INSTALLATION OF MIKTEX ###"
