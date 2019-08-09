#!/usr/bin/env bash
set +e

: > /etc/apk/repositories
#domain="mirrors.ustc.edu.cn"
domain="mirrors.aliyun.com"
echo "http://$domain/alpine/v3.8/main" >> /etc/apk/repositories
echo "http://$domain/alpine/v3.8/community" >> /etc/apk/repositories

apk add --no-cache \
bash sudo shadow sed grep gawk tree xterm wget curl unzip procps htop \
bash-completion busybox-extras ncurses tzdata ca-certificates openssl \
git

dir=/go/src/github.com/rancher/k3s/
mkdir -p $dir
git clone https://github.com/huapox/fk-k3s-master $dir
cd $dir && ls -lh

apk add --no-cache libseccomp #make
apk --update --no-cache add --virtual=.build-dependencies #wget ca-certificates
apk --update --no-cache add openssl-dev build-base linux-headers openssl-dev libstdc++ libgcc

#make
cd scripts
#bash ./release-arm  ##./ci
bash ./download
bash ./build
bash ./package-cli


rm -f /build.sh