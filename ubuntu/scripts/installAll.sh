pathOfThisFile="./installAll.sh"

echo "### INSTALL ALL ###"

for filePath in ./install*.sh; do
    if [ $filePath != $pathOfThisFile ]
    then
        chmod +x "$filePath" # make file executable
	    "$filePath" # execute file
    fi
done
