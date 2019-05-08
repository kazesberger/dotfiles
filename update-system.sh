#!/bin/zsh

rsync --delete -avz ./.localrc.d/ ~/.localrc.d

cp ./.gitconfig ~/.gitconfig
cp ./.gitignore ~/.gitignore
cp ./.ssh/config ~/.ssh/config
cp ./.bash_aliases ~/.bash_aliases
cp ./.sshrc ~/.sshrc

# TODO setup  / mb consider switch to oh-my-zsh
# zsh prezto 
cp ./zsh/.zpreztorc ~/.zpreztorc
cp ./zsh/.zshrc ~/.zshrc
cp ./zsh/.zspaceship ~/.zspaceship

source ~/.zshrc

# now ensure/update the links
rm -f ~/.sshrc.d/.bash_aliases
ln -s ~/.bash_aliases ~/.sshrc.d/.bash_aliases || true

source ~/.bash_aliases

if [ -e /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret ] ; then
    git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
else
    git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring
fi