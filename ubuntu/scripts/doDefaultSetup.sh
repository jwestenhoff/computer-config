# arguments.sh

# Default values of arguments
INTERNET=true
IS_LAPTOP=false
IS_DUAL_BOOT=false
OTHER_ARGUMENTS=()

# Loop through arguments and process them
for arg in "$@"
do
    case $arg in
        -ni|--no-internet)
        INTERNET=false
        shift # Remove argument from processing
        ;;
        -l|--laptop)
        IS_LAPTOP=true
        shift # Remove argument from processing
        ;;  
        -db|--dual-boot)
        IS_DUAL_BOOT=true
        shift # Remove argument from processing
        ;;      
        *)
        OTHER_ARGUMENTS+=("$1")
        shift # Remove argument from processing
        ;;
    esac
done

echo "# internet: $INTERNET"
echo "# is laptop: $IS_LAPTOP"
echo "# is dual boot: $IS_DUAL_BOOT"
echo "# other arguments: ${OTHER_ARGUMENTS[*]}"


echo "## activate minimize to dock"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
echo "## minimize to dock activated"

if [ "$IS_DUAL_BOOT" = true ]; then
  echo "## make linux listen to windows time"
  timedatectl set-local-rtc 1 --adjust-system-clock
  echo "## linux listens to windows time"
fi