#!/bin/bash

pathOfThisFile="./installAll.sh"

for filePath in ./install*.sh; do
  if [[ $filePath != $pathOfThisFile ]]; then
    chmod +x "$filePath"
    "$filePath"
  fi
done
