#!/bin/sh

# https://hub.docker.com/r/gethue/hue
# https://github.com/cloudera/hue/tree/master/tools/docker/hue
# https://gethue.com/getting-started-with-hue-in-2-minutes-with-docker

docker run -d \
-p 8888:8888 \
-v /Users/wangjinjie/Opt/docker-start/hue/log.conf:/etc/hue/conf/log.conf \
-v /Users/wangjinjie/Opt/docker-start/hue/hue.ini:/usr/share/hue/desktop/conf/hue.ini \
--net common-network \
--name some-hue \
gethue/hue:latest

