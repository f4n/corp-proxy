#!/bin/bash

# check if corp-proxy docker container is running
DOCKER_ID=`docker ps -a | grep corp-proxy:latest | awk '{print $1}'`
if [ -n "$DOCKER_ID" ]
then
  # stop container and remove
  docker kill $DOCKER_ID > /dev/null
  docker rm $DOCKER_ID > /dev/null
fi
