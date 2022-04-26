#!/bin/bash

echo "### INSTALLING VISUAL STUDIO CODE ..."

sudo snap install --classic code # install vscode

createSettingsFile() {
    local installedExtensions=$(code --list-extensions)
    local settingsFileName="$1"

    local testSettings=(
        '"files.autosave": "afterDelay"'
        '"workbench.colorTheme": "Default Light+"'
    )

    for extension in ${!extensionsToInstallWithConfig[@]}; do
        if [[ ($installedExtensions == *${extension}*) && ("${extensionsToInstallWithConfig[${extension}]}" != "") ]]; then
            testSettings+=("${extensionsToInstallWithConfig[${extension}]}")
        fi
    done

    printf "{" >$settingsFileName

    local prefix=""
    for key in ${!testSettings[@]}; do
        printf "${prefix}\n  ${testSettings[${key}]}" >>$settingsFileName

        if [[ prefix != "," ]]; then
            prefix=","
        fi
    done

    printf "\n}" >>$settingsFileName
}

installExtensions() {
    local installedExtensions=$(code --list-extensions)

    for extension in "${!extensionsToInstallWithConfig[@]}"; do
        if [[ $installedExtensions != *${extension}* ]]; then
            code --install-extension "$extension"
        fi
    done
}

configureVSCode() {
    local settingsFileName="vscodeSettings.json"

    shopt -s nocasematch # set nocasematch option

    installExtensions

    createSettingsFile $settingsFileName

    shopt -u nocasematch # unset nocasematch option

    parent_path=$(
        cd "$(dirname "${BASH_SOURCE[0]}")"
        pwd -P
    )
    mv "./${settingsFileName}" "$HOME/.config/Code/User/settings.json" # set global settings for vscode
}

if command -v code &>/dev/null; then
    declare -A extensionsToInstallWithConfig
    extensionsToInstallWithConfig+=(
        ["eamodio.gitlens"]='"git.autofetch": true'
        ["vscode-icons-team.vscode-icons"]='"workbench.iconTheme": "vscode-icons"'
        ["James-Yu.latex-workshop"]='"latex-workshop.latex.outDir": "out",\n  "latex-workshop.synctex.synctexjs.enabled": true'
        ["christian-kohler.path-intellisense"]=''
        ["Tabnine.tabnine-vscode"]='"tabnine.experimentalAutoImports": true'
        ["esbenp.prettier-vscode"]=''
        ["streetsidesoftware.code-spell-checker-german"]='"cSpell.language": "en,de"'
        ["foxundermoon.shell-format"]=''
        ["Github.vscode-pull-request-github"]=''
    )

    configureVSCode
fi

echo "... FINISHED INSTALLATION OF VISUAL STUDIO CODE ###"
