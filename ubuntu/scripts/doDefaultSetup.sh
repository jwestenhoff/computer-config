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
        shift # Remove --initialize from processing
        ;;
        -l|--laptop)
        IS_LAPTOP=true
        shift # Remove --initialize from processing
        ;;  
        -db|--dual-boot)
        IS_DUAL_BOOT=true
        shift # Remove --initialize from processing
        ;;      
        *)
        OTHER_ARGUMENTS+=("$1")
        shift # Remove generic argument from processing
        ;;
    esac
done

echo "# Internet: $INTERNET"
echo "# Is laptop: $IS_LAPTOP"
echo "# Is dual boot: $IS_DUAL_BOOT"
echo "# Other arguments: ${OTHER_ARGUMENTS[*]}"

