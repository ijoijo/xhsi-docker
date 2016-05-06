# XHSI application

### What is this?

A Docker image for [XHSI application](xhsi.sourceforge.net).

You can find the Docker Hub repo here: https://hub.docker.com/r/ijoijo/xhsi/


### Pre-requisites

Have X-Plane flight simulator running on the same network as the docker host, with XHSI plugins installed and up&running.

Have a X server running, as XHSI application requires X11 for the  display on Linux.


### Docker Instructions

#### Pull the Docker Image on your device

```bash
$ docker pull ijoijo/xhsi
```


#### Authorize docker to access X11

Warning, this command authorize access on X11 for all local users, which could be a security issue if using multiple users on your host.

```bash
$ xhost +local
```
 
#### Run XHSI

Run the container with the following command:
```bash
$ docker run \
    --net host \ 
    -v /tmp/.X11-unix:/tmp/.X11-unix \ 
    --name xhsi \
    ijoijo/xhsi
```

To stop it:
```bash
$ docker stop xhsi
```

To start it:
```bash
$ docker start xhsi
```


#### Advanced usage

##### XHSI files

XHSI configuration and log files are stored in a specific volume.
To access it, you can run your favourite docker image with XHSI volume.

For example, to access XHSI data volume with Ubuntu linux:

```bash
$ docker run -it --rm --volumes-from xhsi ubuntu sh

/ # ls /XHSI/
XHSI.log         XHSI.properties
```


To use a specific XHSI configuration files hosted on your host (replace with correct folder path of your host containing the XHSI configuration):

```bash
$ docker run \
    --net host \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /XHSIDirectoryOnYourHost/:/XHSI \
    --name xhsi \
    ijoijo/xhsi
```

##### Memory usage

By default, XHSI is launched with default Java memory settings for XHSI: "-Xms512m -Xmx1024m"

If you would like to change it, you can specify XHSI_JAVA_OPTIONS environment variable.

For example, to set minimum memory to 256MB and maximum memory to 512MB:

```bash
$ docker run \
    --net host \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e XHSI_JAVA_OPTIONS="-Xms256m -Xmx512m" \
    --name xhsi \
    ijoijo/xhsi
```


##### X11 Display

By default, XHSI is launched with the environment variable DISPLAY=:0.0

If you would like to change it; you can specify XHSI_DISPLAY environment variable.


### Contributions

Any suggestions and contributions are welcome and encouraged


### License

XHSI software is licensed under the GPLv2 license.
Oracle Java JRE is licensed by the [Oracle Binary Code License](http://www.oracle.com/technetwork/java/javase/terms/license/index.html).
The code for this docker container is licensed under the [MIT License](LICENSE.md).
