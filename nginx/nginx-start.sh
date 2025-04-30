#!/bin/sh

ROOT_DIR=$(dirname $0)/
ROOT_DIR=$(cd $ROOT_DIR;pwd)

docker run -d \
-p 80:80 \
--name some-nginx \
-v /$ROOT_DIR/conf/nginx.conf:/etc/nginx/nginx.conf:ro \
-v /$ROOT_DIR/conf/conf.d:/etc/nginx/conf.d:ro \
nginx:latest
