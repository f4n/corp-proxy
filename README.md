Corporate-Proxy Switcher
=====

In some companies you have to use a proxy server to access the internet.
This is a little bit annoying if you work on different locations or
at home where none (or a different proxy) is available.

With this image you have to configure just once all your proxy
settings to **localhost:3128**. The actual proxy settings will be switched
in the container and you never have to reconfiguring your application
settings (like browser proxy, package manager proxy, dev-tools ...) separately.

Thank you to [chrisdaish](https://github.com/chrisdaish/docker-squid) for the inital container.
It's a slim image (~18MB) of Squid running under Alpine Linux.

How to use
=========

You have to build your container image once

Build
-----
```
cd docker
build.sh # to create a docker image with the name corp-proxy
```
if you already behind a proxy use
```
cd docker
build.sh http://proxy-ip:proxy-port # to create a docker image with the name corp-proxy
```

Configuring
-----------

Available configurations will be store in *.setting files which will be
linked to as squid.conf file by the start script.
In the config folder tho basic setting files available,
* 'default.setting' which is the "home" setting, no forward proxying
* 'company.setting.example' which is a basic example of a company forwad proxy setting

If you want to use it you have to rename company.setting.example to mycompanyname.setting
and modify the file to match your company proxy settings.

You could use as many .setting files as you want.


Start/Switch proxy setting
--------------------------

I recommend to export the corp-proxy path to your PATH variable in the .bashrc

After that you do the following

```
proxy # just call this
```

Optional:

You can add the proxy script with the default option in your .bashrc. 
This option will use the last selected proxy setting directly an starts the proxy on login.

```
vi ~/.bashrc
```
And add at the end

```
/your-path-to-repo/proxy default > /dev/null
```



Expert Mode: Run it on your own
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
