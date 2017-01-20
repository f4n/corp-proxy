#!/bin/bash

docker run --rm \
            -v `pwd`/config/squid.conf:/etc/squid/squid.conf:ro \
            -v `pwd`/cache:/var/cache/squid:rw \
            -v `pwd`/log:/var/log/squid:rw \
            -p 127.0.0.1:3128:3128 \
            docker-proxy:latest
