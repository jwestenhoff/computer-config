#!/bin/bash

# Default values of arguments
INTERNET=true
IS_LAPTOP=false
IS_DUAL_BOOT=false
OTHER_ARGUMENTS=()

echo "# read and process arguments"
for arg in "$@"; do
  case $arg in
  -ni | --no-internet)
    INTERNET=false
    shift # Remove argument from processing
    ;;
  -l | --laptop)
    IS_LAPTOP=true
    shift # Remove argument from processing
    ;;
  -db | --dual-boot)
    IS_DUAL_BOOT=true
    shift # Remove argument from processing
    ;;
  *)
    OTHER_ARGUMENTS+=("$1")
    shift # Remove argument from processing
    ;;
  esac
done

echo " - internet: $INTERNET"
echo " - is laptop: $IS_LAPTOP"
echo " - is dual boot: $IS_DUAL_BOOT"
echo " - other arguments: ${OTHER_ARGUMENTS[*]}"
echo ""

if [ "$INTERNET" = true ]; then
  echo "### UPDATE AND UPGRADE INSTALLED PACKAGES"
  sudo apt update
  sudo apt upgrade -y
  echo ""
fi

echo "### COMMON SETTINGS ###"
echo " - activate minimize to dock"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
echo ""

if [ "$IS_DUAL_BOOT" = true ]; then
  echo "### DUAL BOOT SETTINGS ###"
  echo " - make linux listen to windows time"
  timedatectl set-local-rtc 1 --adjust-system-clock
fi

if [ "$INTERNET" = true ]; then
  echo "### UPDATE AND UPGRADE INSTALLED PACKAGES"
  sudo apt update
  sudo apt upgrade -y
  echo ""
  echo "### AUTOREMOVE UNNECESSARY PACKAGES"
  sudo apt autoremove -y
fi

# todo add installations of several programs
# todo set nightlight
# todo set nautilus shortcut
# todo git conf
# todo ssh key?
# todo fit .bashrc?
# todo set taskbar elements?
# todo set bluetooth on not default (only laptop?)
# todo set default applications (e.g. vlc as default for music)
