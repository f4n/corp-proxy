FROM alpine:3.2

MAINTAINER m@k4r.me

RUN apk update \
    && apk add squid=3.5.23-r0 \
    && apk add curl \
    && rm -rf /var/cache/apk/*

COPY files/start-squid.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/start-squid.sh"]
