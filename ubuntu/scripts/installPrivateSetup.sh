#!/bin/bash

# imports
. "./printHeading.sh" # import print heading function

printInstallHeading "telegram desktop"
sudo snap install telegram-desktop

printInstallHeading "discord"
sudo snap install discord
