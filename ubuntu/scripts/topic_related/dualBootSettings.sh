#!/bin/bash

echo "### DUAL BOOT SETTINGS ###"
echo " - make linux listen to windows time"
timedatectl set-local-rtc 1 --adjust-system-clock
