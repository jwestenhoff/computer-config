#!/bin/bash

### METHODS
triggerAllJobs() {
  for folder in "${!setupsWithJobStatus[@]}"; do
    if [[ !${setupsWithJobStatus[${folder}]} ]]; then
      setupsWithJobStatus[${folder}]=true
    fi
  done
}

setSetupStatusForFolderWhenSomethingInsideHasChanged() {
  for folder in "${!remainingFoldersToCheck[@]}"; do
    if [[ $file == ${folder}/* ]]; then
      setupsWithJobStatus[${folder}]=true
      unset remainingFoldersToCheck[${folder}]
      break
    fi
  done
}

determineJobsToBeExecuted() {
  local workflowFolder=".github/workflows"
  local completeSetupFile="installAll.sh"

  for file in "${changedFiles[@]}"; do
    if [[ ${#remainingFoldersToCheck[@]} == 0 ]]; then
      break
    fi

    if [[ ($file == ${workflowFolder}/*) || ($file == ${completeSetupFile}) ]]; then
      triggerAllJobs "${setupsWithJobStatus[@]}"
      break
    fi

    setSetupStatusForFolderWhenSomethingInsideHasChanged
  done
}

setJobStatusToOutputVariables() {
  echo "The job(s) for the following setup(s) will run:"
  for setup in "${!setupsWithJobStatus[@]}"; do
    echo "::set-output name=run_${setup}_setup::${setupsWithJobStatus[${setup}]}"
    if [[ ${setupsWithJobStatus[${setup}]} == true ]]; then
      echo "- ${setup}"
    fi
  done
}

### PROGRAMM
changedFiles=($(git diff --name-only HEAD^ HEAD))

echo "=============== list of modified files ==============="
for file in ${changedFiles[@]}; do echo $file; done

echo "========== check paths of modified files =========="
declare -A remainingFoldersToCheck=(
  ["dev"]=false
  ["default"]=false
  ["private"]=false
)

declare -A setupsWithJobStatus=(
  ["complete"]=false
)
for key in "${!remainingFoldersToCheck[@]}"; do setupsWithJobStatus["$key"]=false; done

determineJobsToBeExecuted
setJobStatusToOutputVariables
