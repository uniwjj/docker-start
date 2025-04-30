#!/bin/sh

# https://hub.docker.com/r/gethue/hue
# https://github.com/cloudera/hue/tree/master/tools/docker/hue
# https://gethue.com/getting-started-with-hue-in-2-minutes-with-docker

ROOT_DIR=$(dirname $0)/
ROOT_DIR=$(cd $ROOT_DIR;pwd)

docker run -d \
-p 8888:8888 \
-v /$ROOT_DIR/conf/log.conf:/etc/hue/conf/log.conf \
-v /$ROOT_DIR/conf/hue.ini:/usr/share/hue/desktop/conf/hue.ini \
--net common-network \
--name some-hue \
gethue/hue:latest

