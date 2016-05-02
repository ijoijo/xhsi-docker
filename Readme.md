# XHSI application

### What is this?

A Docker image for [XHSI application](xhsi.sourceforge.net).

You can find the Docker Hub repo here: https://hub.docker.com/r/ijoijo/xhsi/


### Pre-requisites

Have x-plane flight simulator running on the same network as the docker host, with XHSI plugins installed and up&running.

Have a X server running, as XHSI application requires X11 for the  display on Linux.

### Docker Instructions

#### Pull the Docker Image on your device

```bash
$ docker pull ijoijo/xhsi
```

#### Run XHSI

```bash
$ docker run \
    --net host \ # Required for multicast (automated IP address detection for XHSI)
    -v /tmp/.X11-unix:/tmp/.X11-unix \ # Mount the X11 socket
    -e XHSI_DISPLAY=unix$DISPLAY \ # Set display
    --name xhsi \
    ijoijo/xhsi
```

#### Advanced usage

##### XHSI files

XHSI configuration and log files are stored in a specific volume.
To access it, you can run your favourite docker image with XHSI volume.

For example, to access XHSI data volume with Alpine linux:

```bash
$ docker run -it --rm --volumes-from xhsi alpine sh

/ # ls /XHSI/
XHSI.log         XHSI.properties
```

##### Memory usage

By default, XHSI is launched with default Java memory settings for XHSI: "-Xms512m -Xmx1024m"

If you would like to change it, you can specify XHSI_JAVA_OPTIONS environment variable.

For example, to set minimum memory to 256MB and maximum memory to 512MB:

```bash
$ docker run \
    --net host \ # Required for multicast (automated IP address detection for X$
    -v /tmp/.X11-unix:/tmp/.X11-unix \ # Mount the X11 socket
    -e XHSI_DISPLAY=unix$DISPLAY \ # Set display
    -e XHSI_JAVA_OPTIONS="-Xms256m -Xmx512m" \ # Set specific java memory settings
    --name xhsi \
    ijoijo/xhsi
```


### Contributions

Any suggestions and contributions are welcome and encouraged


### License

XHSI software is licensed under the GPLv2 license.
The code for this docker container is licensed under the [MIT License.](LICENSE.md)
