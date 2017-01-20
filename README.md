Squid
=====

Slim image (18MB) of Squid 3.5.23 running under Alpine Linux 3.2.

How to use
=========

Use build.sh to create the docker image with the name docker-proxy

```
docker run --rm -p 127.0.0.1:3128:3128 docker-proxy:latest
```

With bespoke configuration:

```
docker run --rm \
            -v `pwd`/config/squid.conf:/etc/squid/squid.conf:ro \
            -v `pwd`/cache:/var/cache/squid:rw \
            -v `pwd`/log:/var/log/squid:rw \
            -p 127.0.0.1:3128:3128 \
            docker-proxy:latest
```
