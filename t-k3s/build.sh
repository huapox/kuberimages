#!/usr/bin/env bash
set +e


dir=/go/src/github.com/rancher/k3s/
mkdir -p $dir
git clone https://github.com/huapox/fk-k3s-master $dir
cd $dir && ls -lh



#make
cd scripts
#bash ./release-arm  ##./ci
bash ./download
bash ./build
bash ./package-cli


rm -f /build.sh