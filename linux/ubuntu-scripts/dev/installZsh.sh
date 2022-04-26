#!/bin/bash

echo "### INSTALLING ZSH ..."

installOhMyZsh() {
    sudo apt install git wget -y # will be installed if not there because they are necessary for oh-my-zsh

    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh

    wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    
    fetch -o - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh

    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc # copy template for oh-my-zsh config
    source ~/.zshrc                                       # rely on oh-my-zsh config
}

sudo apt install zsh -y

if [[ $(echo $0) != "zsh" ]]; then # check if zsh is default shell
    sudo chsh -s $(which zsh)      # use zsh by default
fi

installOhMyZsh

echo "... FINISHED INSTALLATION OF ZSH ###"
