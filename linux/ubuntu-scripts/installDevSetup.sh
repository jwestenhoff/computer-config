#!/bin/bash

echo "# INSTALLING DEV SETUP ..."

# create default folder for projects
mkdir ~/Projects

# execute dev install scripts
for filePath in ./dev/install*.sh; do
    chmod +x "$filePath" # make file executable
    "$filePath"          # execute file
done

echo "... FINISHED INSTALLATION OF DEV SETUP #"
