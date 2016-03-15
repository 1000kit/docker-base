# Dockerized 1000kit base centos image

This repository contains base image that is used to build the portfolio of Docker images for TKIT community projects.


### Operating system
This image uses CentOS 7.

### Installed tools

xmlstarlet saxon augeas bsdtar tar unzip curl wget 

### Working directory

Base user is `tkit` withe home directory `/home/tkit`.
This image has the working directory set to `/opt/tkit`.

### Availability

The `Dockerfile` is available in the `master` branch and is built in the Docker HUB as `1000kit/docker-base:latest`.

## Build Image

Take a Dockerfile and build with the default arguments:

~~~~
$ docker build -t 1000kit/docker-base .
~~~~

