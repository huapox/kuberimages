#!/bin/bash

apk add bash xterm tmux tree wget curl sed sudo shadow |grep OK

##{bin,cnf,cni/bin} err
mkdir -p /down
cd /down
	##rio
	ver=v0.4.0 #v0.5.0-alpha.1
	src=https://github.com/rancher/rio/releases/download/$ver/rio-linux-amd64
	dest=/down/rio
	curl -L $src -o $dest; chmod +x $dest;

	tree -h /down

rm -f /build.sh
