# Boot2DockerExperimental

Builds [Boot2Docker](http://boot2docker.io/) ISO containing [Docker's experimental build](https://blog.docker.com/2015/06/experimental-binary/) with [experimental features](https://github.com/docker/docker/tree/master/experimental).

## Build Boot2Docker ISO

    $ docker build -t boot2docker-experimental .
    $ docker run --rm boot2docker-experimental > boot2docker-experimental.iso

## Use with [Docker Machine](https://docs.docker.com/machine/)

    $ docker-machine create -d virtualbox --virtualbox-boot2docker-url file://"$PWD"/boot2docker-experimental.iso boot2docker-experimental
