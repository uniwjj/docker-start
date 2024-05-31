#!/bin/sh

ROOT_DIR=$(dirname $0)/
ROOT_DIR=$(cd $ROOT_DIR;pwd)

docker run -d \
-p 6379:6379 \
-v $ROOT_DIR/redis.conf:/usr/local/etc/redis/redis.conf \
--name some-redis redis redis-server /usr/local/etc/redis/redis.conf

