#!/bin/bash -e

# TODO extract stuff to install-scripts

# zsh
sudo apt-get install zsh
if [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ] ; then 
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
	rm -f /home/kazesberger/.zlogin /home/kazesberger/.zlogout /home/kazesberger/.zpreztorc /home/kazesberger/.zshenv /home/kazesberger/.zprofile /home/kazesberger/.zshrc
	zsh -c 'setopt EXTENDED_GLOB && for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}" ; done'
	chsh -s /bin/zsh
fi

# bat
which bat || $(wget https://github.com/sharkdp/bat/releases/download/v0.10.0/bat_0.10.0_amd64.deb && sudo dpkg -i bat_0.10.0_amd64.deb)

# linuxbrew
if [ ! -d /home/linuxbrew/.linuxbrew ] ; then 
       	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
	echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> ~/.profile
fi

sudo apt-get install build-essential

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> ~/.profile

# fzf
which fzf || $(brew install fzf && /home/linuxbrew/.linuxbrew/opt/fzf/install)

# TODO cli PR client (hub?)

for script in ./install-scripts/*.sh; do
  bash "$script" -H   || break
done

## NVM
# git clone https://github.com/creationix/nvm.git ~/.nvm
	# ansible-block: ~/.bashrc ~/.zshrc ~/.profile
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# helm
# curl -o helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.13.1-linux-amd64.tar.gz
# tar -xvzf helm.tar.gz
# sudo mv linux-amd64/helm /usr/local/bin/helm
# rm -f helm.tar.gz
# rm -rf helm.tar.gz
sudo snap install helm --classic

git clone https://github.com/ahmetb/kubectx.git ~/git/kubectx
sudo ln -s /home/kazesberger/git/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /home/kazesberger/git/kubectx/kubens /usr/local/bin/kubens

sudo mkdir -p /usr/share/zsh/functions/Completion/kubectx
sudo chmod -R 755 /usr/share/zsh/functions/Completion/kubectx
sudo ln -s ~/git/kubectx/completion/kubectx.zsh /usr/share/zsh/functions/Completion/kubectx/_kubectx.zsh
sudo ln -s ~/git/kubectx/completion/kubens.zsh /usr/share/zsh/functions/Completion/kubectx/_kubens.zsh

sudo apt-get install direnv