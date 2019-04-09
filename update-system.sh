#!/bin/bash

rsync --delete -avz ./.localrc.d/ ~/.localrc.d

cp ./.gitconfig ~/.gitconfig
cp ./.gitignore ~/.gitignore
cp ./.ssh/config ~/.ssh/config
cp ./.bash_aliases ~/.bash_aliases
cp ./.sshrc ~/.sshrc

# now ensure/update the links
rm -f ~/.sshrc.d/.bash_aliases
ln -s ~/.bash_aliases ~/.sshrc.d/.bash_aliases || true

source ~/.bash_aliases