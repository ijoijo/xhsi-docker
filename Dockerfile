FROM ubuntu:16.04

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886 \
  && echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" >> /etc/apt/sources.list \
  && apt-get update \
  && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends oracle-java8-installer unzip libxext6 libxrender1 libxtst6 libxi6 \
  && rm -rf /var/lib/apt/lists/*

RUN wget "http://downloads.sourceforge.net/project/xhsi/xhsi/XHSI-2-0-Beta-9.zip" \
  && unzip XHSI-2-0-Beta-9.zip \
  && rm -rf XHSI-2-0-Beta-9.zip XHSI2_plugin XHSI2_app/Windows XHSI2_app/Linux XHSI2_app/Mac \
  && mkdir /XHSI

VOLUME /XHSI
COPY entrypoint.sh /

WORKDIR /XHSI

ENTRYPOINT ["/entrypoint.sh"]
