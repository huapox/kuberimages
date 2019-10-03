#!/bin/bash

apk add bash xterm tmux tree wget curl sed sudo shadow |grep OK

##{bin,cnf,cni/bin} err
mkdir -p /down
cd /down
	##k3s
	#src=https://github.com/rancher/k3s/releases/download/v0.2.0/k3s
	#src=https://github.com/rancher/k3s/releases/download/v0.4.0/k3s
	#ver=v0.7.0
	ver=v0.8.1
	src=https://github.com/rancher/k3s/releases/download/$ver/k3s
	dest=/down/k3s
	curl -L $src -o $dest; chmod +x $dest;

	tree -h /down

rm -f /build.sh
