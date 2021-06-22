pathOfThisFile="./installAll.sh"
pathOfPrivateSetupFile="./installPrivateSetup.sh"
nonePrivate = false

OTHER_ARGUMENTS=()

echo "# read and process arguments..."
for arg in "$@"; do
  case $arg in
  -np | --none-private)
    nonePrivate=true
    shift # Remove argument from processing
    ;;
  *)
    OTHER_ARGUMENTS+=("$1")
    shift # Remove argument from processing
    ;;
  esac
done
echo ""

echo "### INSTALL ALL ###"
echo " - none-private: $nonePrivate"
echo " - other arguments: ${OTHER_ARGUMENTS[*]}"
echo ""

for filePath in ./install*.sh; do
    notPrivateSetupAndIsPrivateSetupFile=(nonePrivate && $filePath == $pathOfPrivateSetupFile)

    if [ $filePath != $pathOfThisFile && !(notPrivateSetupAndIsPrivateSetupFile) ]
    then
        chmod +x "$filePath" # make file executable
	    "$filePath" # execute file
    fi
done
