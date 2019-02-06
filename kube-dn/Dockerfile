FROM alpine

ARG VCS_REF
ARG BUILD_DATE
ARG URL=https://www.xvideos.com/video36948683/_18_k_


# Note: Latest version of kubectl may be found at:
# https://aur.archlinux.org/packages/kubectl-bin/
ENV KUBE_LATEST_VERSION="v1.11.6"
# Note: Latest version of helm may be found at:
# https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="v2.9.1"

##kubectl && helm
RUN apk add --no-cache ca-certificates bash git xterm tmux tree wget curl sed sudo shadow bash-completion ncurses \
    && wget ${URL} -O /dn-data


WORKDIR /root

CMD bash
