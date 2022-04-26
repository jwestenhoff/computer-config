#!/bin/bash

echo "# INSTALLING PRIVATE SETUP ..."

# execute private install scripts
for filePath in ./private/install*.sh; do
    chmod +x "$filePath" # make file executable
	"$filePath" # execute file
done

echo "... FINISHED INSTALLATION OF PRIVATE SETUP #"
