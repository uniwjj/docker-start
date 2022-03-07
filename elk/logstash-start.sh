#!/bin/bash

# 配置地址
# https://hub.docker.com/_/logstash

# 参考地址
# https://www.elastic.co/guide/en/logstash/current/docker-config.html
# https://www.kancloud.cn/aiyinsi-tan/logstash/849604

# 创建网络
# docker network create common-network

docker run -d \
--name some-logstash \
--net common-network \
-v /usr/local/etc/elk/logstash.conf:/usr/share/logstash/pipeline/logstash.conf \
-e xpack.monitoring.elasticsearch.url=http://some-elasticsearch:9200 \
logstash:6.8.0

