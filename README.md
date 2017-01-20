Corporate-Proxy Switcher
=====

In some firms you have to use a proxy server to access the internet.
This is a little bit annoying if you work on different locations or
at home where a different proxy or none is available.

With this image you have to configure just once all your proxy
settings to **localhost:3128**. The actual proxy settings will be switched
in the container automatically and you never have to reconfiguring your
application settings (like browser proxy, package manager proxy, ...) separately.

Thank you to [chrisdaish](https://github.com/chrisdaish/docker-squid) for the inital container.
It's a slim image (18MB) of Squid 3.5.23 running under Alpine Linux 3.2.

How to use
=========

Build
-----
Execute once before first use of start/stop
```
build.sh # to create a docker image with the name corp-proxy
```

Start/Stop
-----

```
start.sh # to start/restart corp-proxy
```

```
stop.sh # to stop corp-proxy
```

```
reconfigure.sh # add this script to your post-if.up and modify to match your network settings
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
