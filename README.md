# Boot2DockerExperimental

Builds [customized Boot2Docker ISO](https://github.com/boot2docker/boot2docker/blob/master/doc/BUILD.md) containing [Docker's experimental build](https://blog.docker.com/2015/06/experimental-binary/) with [experimental features](https://github.com/docker/docker/tree/master/experimental), to be used with [Docker Machine](https://docs.docker.com/machine/) or [Boot2Docker CLI](https://github.com/boot2docker/boot2docker-cli).

## Option 1: Use Boot2DockerExperimental ISO from Releases

Use the `boot2docker.iso` from the [latest release](https://github.com/ahbeng/boot2docker-experimental/releases/latest).

### Use with Docker Machine

    $ docker-machine create -d virtualbox --virtualbox-boot2docker-url $(curl https://api.github.com/repos/ahbeng/boot2docker-experimental/releases/latest | grep -o https://.*/boot2docker.iso) boot2docker-experimental

### Use with Boot2Docker CLI

    $ boot2docker --iso="$HOME/.boot2docker/boot2docker-experimental.iso" --iso-url=https://api.github.com/repos/ahbeng/boot2docker-experimental/releases --sshport=2023 --vm=boot2docker-experimental-vm init
    $ boot2docker --vm=boot2docker-experimental-vm up
    $ eval $(boot2docker --vm=boot2docker-experimental-vm shellinit)

## Option 2: Use Boot2DockerExperimental ISO from Docker image

Use the `boot2docker.iso` from the Docker image created by Docker Hub's [Automated Builds](https://docs.docker.com/docker-hub/builds/):

    $ docker run --rm ahbeng/boot2docker-experimental > boot2docker-experimental.iso

Or build the Docker image yourself:

    $ git clone https://github.com/ahbeng/boot2docker-experimental.git
    $ cd boot2docker-experimental
    $ docker build -t boot2docker-experimental .
    $ docker run --rm boot2docker-experimental > boot2docker-experimental.iso

### Use with Docker Machine

    $ docker-machine create -d virtualbox --virtualbox-boot2docker-url "file://$PWD/boot2docker-experimental.iso" boot2docker-experimental

### Use with Boot2Docker CLI

    $ boot2docker --iso=boot2docker-experimental.iso --sshport=2023 --vm=boot2docker-experimental-vm init
    $ boot2docker --vm=boot2docker-experimental-vm up
    $ eval $(boot2docker --vm=boot2docker-experimental-vm shellinit)
