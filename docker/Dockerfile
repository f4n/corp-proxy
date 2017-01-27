FROM alpine:latest

MAINTAINER m@k4r.me

RUN apk update \
    && apk add squid \
    && apk add curl \
    && rm -rf /var/cache/apk/*

COPY files/start-squid.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/start-squid.sh"]
