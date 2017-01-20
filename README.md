Squid
=====

Slim image (18MB) of Squid 3.5.23 running under Alpine Linux 3.2.

How to use
=========

Execute before first use of start/stop
```
build.sh # to create a docker image with the name corp-proxy
```

```
start.sh # to start/restart corp-proxy
```

```
stop.sh # to stop corp-proxy
```


Run it on your own
==========

```
docker run --rm -p 127.0.0.1:3128:3128 corp-proxy:latest
```

With custom configuration:

```
docker run --rm \
            --name corp-proxy \
            -v `pwd`/config/squid.conf:/etc/squid/squid.conf:ro \
            -v `pwd`/cache:/var/cache/squid:rw \
            -v `pwd`/log:/var/log/squid:rw \
            -p 127.0.0.1:3128:3128 \
            corp-proxy:latest
```
