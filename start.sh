#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# check if corp-proxy docker container is already running
DOCKER_ID=`docker ps -a | grep corp-proxy:latest | awk '{print $1}'`
if [ -n "$DOCKER_ID" ]
then
  DOCKER_ID_RUN=`docker ps | grep corp-proxy:latest | awk '{print $1}'`
  if [ -n "$DOCKER_ID_RUN" ]
  then
    exit 0;
  fi
  docker rm $DOCKER_ID > /dev/null
fi

# otherwise start a new corp-proxy container
docker run  -d  \
            --name corp-proxy \
            -v $SCRIPT_DIR/config/squid.conf:/etc/squid/squid.conf:ro \
            -v $SCRIPT_DIR/cache:/var/cache/squid:rw \
            -v $SCRIPT_DIR/log:/var/log/squid:rw \
            -p 127.0.0.1:3128:3128 \
            -e USER_NAME=`whoami` \
            -e USER_ID=`id -u` \
            corp-proxy:latest
