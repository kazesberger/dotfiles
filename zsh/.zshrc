#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export PATH=$PATH:/opt/minishift:/opt/riemann/current/bin:/home/linuxbrew/.linuxbrew/bin

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

source ~/.localrc.d/*.sh

source ~/.zspaceship
source ~/.bash_aliases

unset KUBECONFIG
for file in ~/.kube/* ; do 
  if [ -f $file ] ; then 
     export KUBECONFIG=$KUBECONFIG:$file
  fi
done

source <(kubectl completion zsh)
source <(helm completion zsh)
source <(minikube completion zsh)
source <(skaffold completion zsh)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# echo "SPACESHIP_CONFIG:"
# echo "--------------------------"
# env | grep SPACESHIP

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin

eval "$(direnv hook zsh)"
