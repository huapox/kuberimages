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

RUN apt update \
&& val=$(echo -e """\n\
jgmenu\n\
bunsen-common\n\
bunsen-configs\n\
bunsen-configs-pulse\n\
bunsen-conky\n\
bunsen-docs\n\
bunsen-exit\n\
bunsen-fortune\n\
bunsen-images\n\
bunsen-keyring\n\
bunsen-os-release\n\
bunsen-papirus-icon-theme\n\
bunsen-pipemenus\n\
bunsen-themes\n\
bunsen-thunar\n\
bunsen-utilities\n\
bunsen-welcome\n\
""") \
&& items=($val) \
&& apt -yd install --no-install-recommends "${items[@]}" \
&& find /var/cache/apt/archives/ -type f |grep -v "bunsen\|jgmenu" |xargs rm -f
# items=$(sed 's/\#.*$//' pkgs-recs) \

#ENTRYPOINT ["/startup.sh"]