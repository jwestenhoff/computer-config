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

