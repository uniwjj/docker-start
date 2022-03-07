#!/bin/sh

docker run -d \
-p 6379:6379 \
-v /tmp/redis/redis.conf:/usr/local/etc/redis/redis.conf \
--name some-redis redis redis-server /usr/local/etc/redis/redis.conf

