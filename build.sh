#!/bin/bash

BUILD_ARGS=""
if [ -n "$1" ]
then
  BUILD_ARGS="--build-arg http_proxy=$1 --build-arg https_proxy=$1 --build-arg HTTP_PROXY=$1 --build-arg HTTPS_PROXY=$1"
fi

#create corp-proxy docker image
docker build -f Dockerfile --rm -t corp-proxy $BUILD_ARGS .
