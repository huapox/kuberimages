#!/usr/bin/env bash
set +e


dir=/go/src/github.com/rancher/k3s/
mkdir -p $dir
git clone -b sam-v070 https://github.com/huapox/fk-k3s-custom $dir #default: sam-custom v081
cd $dir && ls -lh
git branch -a


#make
cd scripts
cat /download-rep > ./download #rep
#bash ./release-arm  #./ci  #./clean
bash ./download
bash ./build

#./package
##COPY --from=src /go/src/github.com/rancher/k3s/dist/artifacts/k3s (ff: att-k3s-prs)
##ADD build/out/data.tar.gz (package/Dockerfile)
bash ./package-cli  ##
##dind: outer-multi docker-build (same: avoid edit package-image_no-push, package/Dockerfile)
#bash ./package-image  
#bash ./package-airgap ##no build here


rm -f /build.sh