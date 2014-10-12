#!/bin/sh

# change dir to ansible directory
cd $(dirname $0)

if [ "$1" = "" ]; then
    echo usage: $0 target
    echo example: $0 demo
    exit 1
fi

INVENTORY=inventory/$1

if [ ! -e $INVENTORY ]; then
    echo $0: $INVENTORY: No such file or directory
    exit 1
fi

LIMITER=""

if [ "$2" != "" ]; then
	LIMITER="--limit $2"
fi

# pass a timestamp that is used for every task on every host
ansible-playbook -i $INVENTORY install-openvpn.yml $LIMITER