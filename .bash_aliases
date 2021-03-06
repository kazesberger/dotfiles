export ANSIBLE_DEV_ENV_IMG=grzosdocker01.infonova.at/infonova/ansible-openstack-environment:1.8

#alias workonJdk9='export JAVA_HOME=/usr/java/JDK9'
#alias workonJdk8='export JAVA_HOME=/usr/java/JDK8'
#alias workonJdk7='export JAVA_HOME=/usr/java/JDK7'
workonJdk() {
        export JAVA_HOME=/usr/java/JDK${1}
        rm -f /usr/java/workon && ln -s ${JAVA_HOME} /usr/java/workon
}

alias vi='vim'
alias ssh='sshrc '
alias sshr='ssh -A -l root '
alias sshc='ssh -A -l core '
alias l='ls -lahtr'
alias scp-ext='rsync -z --partial --size-only --progress --rsh="ssh -p 22 -c blowfish-cbc"'
alias air=/opt/air/air.sh
alias chownme='sudo chown -R kazesberger:kazesberger'
alias ansible_dev_env='docker run -ti --hostname "kazesberger-WS" --entrypoint=/bin/bash "$@" -v `pwd`:/work -v ~/.m2/settings.xml:/root/.m2/settings.xml \
    -e SSH_PRIV_KEY=id_rsa \
    -v ~/.ssh:/tmp/.ssh.host \
    -v ~/.vpass:/tmp/.vpass \
    -v ~/.jenkins-api-tokens.vpass:/tmp/jenkins-api-tokens.vpass:ro \
    -v ~/.jenkins-api-tokens.yml:/tmp/jenkins-api-tokens.yml:ro \
    -v ~/openrc.sh:/tmp/openrc.sh \
    --net=host \
    -w /work \
    ${ANSIBLE_DEV_ENV_IMG}'
alias av='ansible-vault  --vault-password-file=~/.vpass'
alias ap='ansible-playbook  --vault-password-file=~/.vpass'

alias ade='ansible_dev_env'
alias ader='ansible_dev_env_with_role'

# TODO delete this after including snx config
alias vpn='snx -s vpn.infonova.com -u kazesberger'
alias sudo='sudo ' # https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo

alias cat='bat -p '
alias pipenv3='pipenv --three '

# https://github.com/kubernetes/kubernetes/issues/27308
# alias k='kubectl "--context=${KUBECTL_CONTEXT:-$(kubectl config current-context)}" ${KUBECTL_NAMESPACE/[[:alnum:]-]*/--namespace=${KUBECTL_NAMESPACE}}'

alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias cd......="cd ../../../../.."

function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}


export PATH="$PATH:/home/kazesberger/git/sips/platform/istio-1.1.5/bin"

alias mks='KUBECONFIG=~/.kube/minikube minikube start'

function kbopensvc {
  local svc_name=$1
  local ns=$2
  echo https://$(kbg svc $svc_name -n $ns -o jsonpath='{.status.loadBalancer.ingress[0].ip}'):$(kbg svc $svc_name -n $ns -o jsonpath='{.spec.ports[0].targetPort}')
}