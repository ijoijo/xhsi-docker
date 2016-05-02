FROM java:8-alpine

RUN wget "http://downloads.sourceforge.net/project/xhsi/xhsi/XHSI-2-0-Beta-8.zip" \
  && unzip XHSI-2-0-Beta-8.zip \
  && rm -rf XHSI-2-0-Beta-8.zip XHSI2_plugin XHSI2_app/Windows XHSI2_app/Linux XHSI2_app/Mac \
  && mkdir /XHSI

VOLUME /XHSI
COPY entrypoint.sh /

WORKDIR /XHSI

ENTRYPOINT ["/entrypoint.sh"]
