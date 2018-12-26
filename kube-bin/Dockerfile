#FROM scratch
FROM frolvlad/alpine-glibc
MAINTAINER sam <sldevsir@126.com>

#timeZone
ENV TIMEZONE Asia/Shanghai
#lang
ENV LANG C.UTF-8
#version
ENV ver=v1
EXPOSE 22

USER root
COPY ["/_cm", "/_c"]
WORKDIR /_c
#RUN sh ./base_build.sh
RUN sh ./sub_build.sh && rm -rf /_c/*

##run as root
#USER entry
#ENTRYPOINT ["/.dockersys/.sub_entry.sh", "sub-jav-jk2slave-java", "jk2slave-java"]
