#!/bin/bash

# 配置地址
# https://hub.docker.com/_/kibana

# 参考地址
# https://ken.io/note/elk-deploy-guide
# https://zning.me/15426292562675.html
# https://www.elastic.co/guide/cn/kibana/current/docker.html

# 创建网络
# docker network create common-network

docker run -d \
--name some-kibana \
--net common-network \
-p 5601:5601 \
-e ELASTICSEARCH_URL=http://some-elasticsearch:9200 \
kibana:9.0.1

