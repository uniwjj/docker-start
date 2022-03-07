#!/bin/bash

# 配置地址
# https://hub.docker.com/_/elasticsearch?tab=description

# 参考地址
# https://ken.io/note/elk-deploy-guide
# https://zning.me/15426292562675.html

# 创建网络
# docker network create common-network

docker run -d \
--name some-elasticsearch \
--net common-network \
-p 9200:9200 \
-p 9300:9300 \
-e "discovery.type=single-node" \
-e "ES_JAVA_OPTS=-Xms1g -Xmx1g" \
elasticsearch:7.16.1

