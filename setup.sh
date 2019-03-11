#!/bin/bash -e

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
