FROM ubuntu:16.04

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C2518248EEA14886 \
  && echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" >> /etc/apt/sources.list \
  && apt-get update \
  && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends unzip libxext6 libxrender1 libxtst6 libxi6 ca-certificates \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends oracle-java8-installer oracle-java8-set-default \
  && rm -rf /var/lib/apt/lists/*

RUN wget "http://downloads.sourceforge.net/project/xhsi/xhsi/XHSI-2-0-Beta-10.zip" \
  && unzip XHSI-2-0-Beta-10.zip \
  && rm -rf XHSI-2-0-Beta-10.zip XHSI2_plugin \
  && mkdir /XHSI

VOLUME /XHSI
COPY entrypoint.sh /

WORKDIR /XHSI

ENTRYPOINT ["/entrypoint.sh"]
