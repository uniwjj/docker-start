#!/bin/bash

# 参考地址
# https://github.com/apache/skywalking-docker
# https://hub.docker.com/r/apache/skywalking-ui
# https://github.com/apache/skywalking-docker/blob/master/ui/Dockerfile

# 创建网络
# docker network create common-network

docker run -d \
--name some-skywalking-ui \
--net common-network \
-e SW_OAP_ADDRESS=http://some-skywalking-oap:12800 \
-p 8080:8080 \
apache/skywalking-ui:8.7.0

