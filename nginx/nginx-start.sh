#!/bin/sh

docker run -d \
-p 80:80 \
-v /path/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
-v /path/nginx/conf.d:/etc/nginx/conf.d:ro \
--name some-nginx \
nginx:latest

