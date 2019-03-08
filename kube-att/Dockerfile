FROM alpine

ARG VCS_REF
ARG BUILD_DATE


ENV KUBE_LATEST_VERSION="v1.11.6"
ENV HELM_VERSION="v2.9.1"

##kubectl && helm
RUN apk add --no-cache ca-certificates bash git xterm tmux tree wget curl sed sudo shadow bash-completion ncurses \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && ln -s /usr/local/bin/kubectl /usr/local/bin/kc \
    && wget -q https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && ln -s /usr/local/bin/helm /usr/local/bin/hm


RUN mkdir -p /opt/k8s-client && cd /opt/k8s-client \
  && git clone https://github.com/jonmosco/kube-ps1.git \
    && git clone https://github.com/ahmetb/kubectx.git \
  && ln -s /opt/k8s-client/kubectx/kubectx /usr/local/bin/kkx \
  && ln -s /opt/k8s-client/kubectx/kubens /usr/local/bin/kkn \
  && kubectl completion bash |sed "s^kubectl^kc^g" > /opt/k8s-client/kubectl-completion.sh \
  && ls -lh /

#&& echo "PS1='[\u@\h \$(kube_ps1) \W]\$ '"  >> /root/.bashrc
RUN echo "source /usr/share/bash-completion/bash_completion" >> /root/.bashrc \
  && echo "source /opt/k8s-client/kube-ps1/kube-ps1.sh" >> /root/.bashrc \
  && echo "source /opt/k8s-client/kubectl-completion.sh" >> /root/.bashrc \
  && echo "alias ll='ls -l'"  >> /root/.bashrc \
  && echo "PS1='[\$(kube_ps1)]\$ '"  >> /root/.bashrc

#RUN cd /bin && mv sh sh00 && ln -s bash sh


WORKDIR /root

CMD bash
