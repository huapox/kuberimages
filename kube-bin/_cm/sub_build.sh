#!/bin/bash

#sh ./bash_build.sh
#apk add bash xterm tmux screen tree wget curl tzdata sed sudo shadow openssh |grep OK
apk add bash xterm tmux tree wget curl sed sudo shadow |grep OK

mkdir -p /down
cd /down
#RELEASE=v1.11.2
#curl -L --remote-name-all http://o7gg8x7fi.bkt.clouddn.com/k8s-${RELEASE}/{kubeadm,kubectl,kubelet}
RELEASE=v1.11.6
curl -L --remote-name-all https://storage.googleapis.com/kubernetes-release/release/${RELEASE}/bin/linux/amd64/{kubeadm,kubelet,kubectl}


ls -lh /down

