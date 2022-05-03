#!/bin/bash

ubuntuScriptPath=$1

pathOfThisFile="${ubuntuScriptPath}/installAll.sh"

for filePath in ${ubuntuScriptPath}/install*.sh; do
  if [[ $filePath != $pathOfThisFile ]]; then
    chmod +x "$filePath"
    "$filePath" ${ubuntuScriptPath}

    if [[ $status != 0 ]]; then
      exit $status
    fi
  fi
done
