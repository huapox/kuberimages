FROM frolvlad/alpine-glibc
MAINTAINER sam <sldevsir@126.com>

USER root

ADD *.sh /
RUN sh /build.sh

##run as root
USER root
WORKDIR /
