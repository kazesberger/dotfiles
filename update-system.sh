#!/bin/bash

rm -rf ~/.dotfile-scripts.d
cp -r ./.dotfile-scripts.d ~/.dotfile-scripts.d

cp ./.gitconfig ~/.gitconfig
cp ./.gitignore ~/.gitignore
cp ./.ssh/config ~/.ssh/config
cp ./.bash_aliases ~/.bash_aliases
cp ./.sshrc ~/.sshrc

# now ensure/update the links
rm -f ~/.sshrc.d/.bash_aliases ~/.bash_aliases
