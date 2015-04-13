BTSync Dockerfile
=============

This repository contains Dockerfile of BTSync for Docker's automated build published to the public Docker Hub Registry.

# Base Docker Image
[kdelfour/supervisor-docker](https://registry.hub.docker.com/u/kdelfour/supervisor-docker/)

# Installation

## Install Docker.

Download automated build from public Docker Hub Registry: docker pull kdelfour/btsync-docker:latest

(alternatively, you can build an image from Dockerfile: docker build -t="kdelfour/btsync-docker" github.com/kdelfour/btsync-docker)

## Usage

    docker run -it -d -p 80:80 -p 3369:3369 kdelfour/btsync-docker:latest
    
You can add a shared directory as a volume directory with the argument *-v /your-path/data/:/data/* like this :

    docker run -it -d -p 80:80 -p 3369:3369 -v /your-path/data/:/data/ kdelfour/btsync-docker:latest

An embedded database is available.
    
## Build and run with custom config directory

Get the latest version from github

    git clone https://github.com/kdelfour/btsync-docker
    cd btsync-docker/

Build it

    sudo docker build --force-rm=true --tag="$USER/btsync-docker:latest" .
    
And run

    sudo docker run -d -p 80:80 -p 3369:3369 -v /your-path/data/:/data/ $USER/btsync-docker:latest
    
Enjoy !!    