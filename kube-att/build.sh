#!/bin/bash

apk add bash xterm tmux tree wget curl sed sudo shadow |grep OK

##{bin,cnf,cni/bin} err
##TODO merge to kube-bin
mkdir -p /down
cd /down
	##rbac-lookup
	src=https://github.com/reactiveops/rbac-lookup/releases/download/v0.2.1/rbac-lookup_0.2.1_Linux_x86_64.tar.gz
	curl -L $src | tar -C /tmp -xz
	mv /tmp/rbac-lookup /down/ && rm -rf /tmp/*
	
	##dcp
	src=https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m`
	dest=/down/docker-compose
	curl -L $src -o $dest; chmod +x $dest;

	tree -h /down

rm -f /build.sh
