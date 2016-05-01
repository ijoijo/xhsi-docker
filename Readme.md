# XHSI application

### What is this?

A Docker image for [XHSI application](xhsi.sourceforge.net).

You can find the Docker Hub repo here: [https://hub.docker.com/r/ijoijo/armhf-swift/](https://hub.docker.com/r/ijoijo/xhsi/)

### Pre-requisites
Have x-plane flight simulator running on the same network as the docker host, with XHSI plugins installed and up&running.

Have a X server running, as XHSI application requires X11 for the  display on Linux.

### Docker Instructions

#### Pull the Docker Image on your device

```bash
docker pull ijoijo/xhsi
```

#### Run XHSI

```bash
docker run -it ijoijo/xhsi


### Contributions

Any suggestions and contributions are welcome and encouraged


### License

XHSI software is licensed under the GPLv2 license.
The code for this docker container is licensed under the [MIT License.](LICENSE.md)
