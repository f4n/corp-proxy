#!/bin/bash

#create corp-proxy docker image
docker build -f Dockerfile --rm -t corp-proxy .
