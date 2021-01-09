FROM registry.cn-shenzhen.aliyuncs.com/infrastlabs/fat-debian

RUN domain="mirrors.163.com" \
 && echo "deb http://$domain/debian/ buster main contrib non-free" > /etc/apt/sources.list \
 && echo "deb http://$domain/debian/ buster-updates main contrib non-free">> /etc/apt/sources.list


# rsync 
RUN apt update \
  && apt install -y apt-transport-https bash sudo curl wget gnupg \
  && apt clean
RUN cd /bin && mv sh sh00 && ln -s /bin/bash sh

# COPY ./etc/apt/sources.list.d /etc/apt/sources.list.d
# COPY ./etc/apt/trusted.gpg.d /etc/apt/trusted.gpg.d
RUN wget https://ddl.bunsenlabs.org/ddl/BunsenLabs-RELEASE.asc \
  && sudo apt-key add BunsenLabs-RELEASE.asc
RUN echo "deb https://pkg.bunsenlabs.org/debian lithium main">> /etc/apt/sources.list

# COPY ./pkgs-norecs /pkgs-norecs
# COPY ./pkgs-recs /pkgs-recs
# RUN apt update \
# && apt install -yd bunsen-paper-icon-theme bunsen-images \
# && apt install -yd bunsen-common bunsen-configs bunsen-configs-pulse bunsen-conky \
# bunsen-docs bunsen-exit bunsen-fortune bunsen-keyring bunsen-os-release \
# bunsen-pipemenus bunsen-themes bunsen-thunar bunsen-utilities bunsen-welcome

# RUN apt update \
# items=$(sed 's/\#.*$//' pkgs-norecs) \
# && apt -y install --no-install-recommends "${items[@]}"

RUN apt update \
&& items=(bunsen-paper-icon-theme bunsen-images \
bunsen-common bunsen-configs bunsen-configs-pulse bunsen-conky \
bunsen-docs bunsen-exit bunsen-fortune bunsen-keyring bunsen-os-release \
bunsen-pipemenus bunsen-themes bunsen-thunar bunsen-utilities bunsen-welcome) \
&& apt -yd install --no-install-recommends "${items[@]}"
# items=$(sed 's/\#.*$//' pkgs-recs) \

#ENTRYPOINT ["/startup.sh"]