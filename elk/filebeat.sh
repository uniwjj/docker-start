#!/bin/bash

# 配置地址
# https://www.elastic.co/guide/en/beats/filebeat/7.2/running-on-docker.html

# 参考地址

# 创建网络
# docker network create common-network

# docker run -d --name some-elasticsearch --net common-network -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:6.8.0

