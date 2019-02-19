#!/bin/bash


ansible_dev_env_with_role() {
    if [ -z "$1" ]
    then
        echo "usage: ./role_dev_env.sh <dirname_of_role_within_parent_dir>" >&2
        echo 'example: ./role_dev_env.sh delivery-foo    #  while delivery-foo is a folder in `pwd`/../' >&2
        echo "" >&2

    else

        export role2mount=$1
        shift

        docker run -ti --hostname "kazesberger-WS" --entrypoint=/bin/bash "$@" -v `pwd`:/work -v ~/.m2/settings.xml:/root/.m2/settings.xml \
            -v ~/.ssh:/tmp/.ssh.host \
            -v ~/.vpass:/tmp/.vpass \
            -v ~/openrc.sh:/tmp/openrc.sh \
            -v `pwd`/../${role2mount}:/root/.ansible/roles/${role2mount}:ro \
            --net=host \
            -w /work \
            ${ANSIBLE_DEV_ENV_IMG}

            # --dns 195.3.81.38 --dns 195.3.81.41 \

    fi
}