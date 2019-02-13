#!/bin/bash

#sh ./bash_build.sh
#apk add bash xterm tmux screen tree wget curl tzdata sed sudo shadow openssh |grep OK
apk add bash xterm tmux tree wget curl sed sudo shadow |grep OK

##{bin,cnf,cni/bin} err
mkdir -p /down/bin
mkdir -p /down/cni/bin
mkdir -p /down/cnf
cd /down

CNI_VERSION="v0.6.0"  #CNI v0.7.4
curl -L "https://github.com/containernetworking/plugins/releases/download/${CNI_VERSION}/cni-plugins-amd64-${CNI_VERSION}.tgz" | tar -C /down/cni/bin -xz
#curl -L "http://o7gg8x7fi.bkt.clouddn.com/k8s-v1.11.2/cni-plugins-amd64-v0.6.0.tgz" | tar -C /opt/cni/bin -xz

CRICTL_VERSION="v1.11.1" #cri-tools v1.13.0
curl -L "https://github.com/kubernetes-incubator/cri-tools/releases/download/${CRICTL_VERSION}/crictl-${CRICTL_VERSION}-linux-amd64.tar.gz" | tar -C /down/bin -xz
#curl -L "http://o7gg8x7fi.bkt.clouddn.com/k8s-v1.11.2/crictl-v1.11.1-linux-amd64.tar.gz" | tar -C /opt/bin -xz

#RELEASE=v1.11.2
#curl -L --remote-name-all http://o7gg8x7fi.bkt.clouddn.com/k8s-${RELEASE}/{kubeadm,kubectl,kubelet}
RELEASE=v1.11.6
curl -L --remote-name-all https://storage.googleapis.com/kubernetes-release/release/${RELEASE}/bin/linux/amd64/{kubeadm,kubelet,kubectl}
chmod +x kube*

RELEASE=v1.11.6
#mkdir -p /etc/systemd/system/kubelet.service.d
#curl -sSL "https://raw.githubusercontent.com/kubernetes/kubernetes/${RELEASE}/build/debs/kubelet.service" | sed "s:/usr/bin:/opt/bin:g" > /down/etc/systemd/system/kubelet.service
#curl -sSL "https://raw.githubusercontent.com/kubernetes/kubernetes/${RELEASE}/build/debs/10-kubeadm.conf" | sed "s:/usr/bin:/opt/bin:g" > /down/etc/systemd/system/kubelet.service.d/10-kubeadm.conf
curl -sSL "https://raw.githubusercontent.com/kubernetes/kubernetes/${RELEASE}/build/debs/kubelet.service" > /down/cnf/kubelet.service
curl -sSL "https://raw.githubusercontent.com/kubernetes/kubernetes/${RELEASE}/build/debs/10-kubeadm.conf" > /down/cnf/10-kubeadm.conf


#========================
#mkdir -p /opt/k-bin-volume/
#docker run -it --rm -v /opt/k-bin-volume/:/volume registry.cn-shenzhen.aliyuncs.com/k-bin/sync-kube:kube-bin sh -c 'cp /down/* /volume/'

#vi /etc/profile
#PATH=/opt/bin:/opt/cni/bin:$PATH
#export PATH


#ls -lh /down
tree -h /down

