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

for file in ~/.kube/* ; do 
  if [ -f $file ] ; then 
     export KUBECONFIG=$KUBECONFIG:$(basename $file)
  fi
done

source <(kubectl completion zsh)
source <(helm completion zsh)
source <(minikube completion zsh)

# echo "SPACESHIP_CONFIG:"
# echo "--------------------------"
# env | grep SPACESHIP

export GOPATH=$HOME/go

