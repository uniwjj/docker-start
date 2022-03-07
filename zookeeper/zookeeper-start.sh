#!/bin/bash

# 创建共享网络
# docker network create zk-network

# 参考资料
# https://hub.docker.com/_/zookeeper?tab=description

docker run -d \
--restart always \
--net zk-network \
-p 2181:2181 \
--name some-zookeeper zookeeper

