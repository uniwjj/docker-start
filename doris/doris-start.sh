#!/bin/bash

# 配置地址
# https://hub.docker.com/r/apache/doris
# 8030是HTTP端口，9030是MySQL端口
# 默认没有密码，用户为root，可以通过SET PASSWORD = PASSWORD('ginger')设置密码。

# docker network create common-network

docker run -d \
--name some-doris \
--net common-network \
-p 8030:8030 \
-p 9030:9030 \
apache/doris:doris-all-in-one-2.1.0

