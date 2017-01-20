#!/bin/bash

DOCKER_ID=`docker ps -a | grep corp-proxy:latest | awk '{print $1}'`

if [ -n "$DOCKER_ID" ]
then
  docker stop $DOCKER_ID > /dev/null
  docker rm $DOCKER_ID > /dev/null
fi
