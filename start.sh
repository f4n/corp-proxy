#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DOCKER_ID=`docker ps -a | grep corp-proxy:latest | awk '{print $1}'`

if [ -n "$DOCKER_ID" ]
then
  $SCRIPT_DIR/stop.sh
fi

docker run  -d  \
            --name corp-proxy \
            -v $SCRIPT_DIR/config/squid.conf:/etc/squid/squid.conf:ro \
            -v $SCRIPT_DIR/cache:/var/cache/squid:rw \
            -v $SCRIPT_DIR/log:/var/log/squid:rw \
            -p 127.0.0.1:3128:3128 \
            corp-proxy:latest
