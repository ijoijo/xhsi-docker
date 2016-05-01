#! /bin/sh

if [ -n "${XHSI_DISPLAY}" ]; then
  echo "Using display ${XHSI_DISPLAY}"
  export DISPLAY=$XHSI_DISPLAY
else
  echo "Using default display :0.0"
  export DISPLAY=:0.0
fi

if [ ! -n "${XHSI_JAVA_OPTIONS}" ]; then
  echo "Using default memory settings"
  export XHSI_JAVA_OPTIONS="-Xms512m -Xmx1024m"
fi

cd /XHSI
java ${XHSI_JAVA_OPTIONS} -jar /XHSI2_app/Java/XHSI.jar
