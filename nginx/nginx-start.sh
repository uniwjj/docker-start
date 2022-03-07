#!/bin/sh

docker run -d \
-p 8888:8888 \
--name some-nginx \
nginx:latest


