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

bash ./topic_related/generalSettings.sh # set general settings

if [ "$INTERNET" = true ]; then
  bash ./topic_related/internetNeeded.sh
fi

if [ "$IS_DUAL_BOOT" = true ]; then
  bash ./topic_related/dualBootSettings.sh
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
