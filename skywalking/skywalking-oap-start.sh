#!/bin/bash

# 参考地址
# https://github.com/apache/skywalking-docker
# https://hub.docker.com/r/apache/skywalking-oap-server
# https://github.com/apache/skywalking-docker/blob/master/oap-server/Dockerfile

# 创建网络
# docker network create common-network

# 存储配置
# storage.selector，存储引擎，包括h2，elasticsearch，elasticsearch7，mysql，tidb，influxdb，postgresql，zipkin-elasticsearch7
# MySQL为例，默认值如下：
# SW_JDBC_URL:"jdbc:mysql://localhost:3306/swtest"
# SW_DATA_SOURCE_USER:root
# SW_DATA_SOURCE_PASSWORD:root@1234

# 需要将MySQL驱动放到/tmp/driver目录
# docker run -d \
# --name some-skywalking-oap \
# --net common-network \
# -e SW_STORAGE=mysql \
# -e SW_JDBC_URL=jdbc:mysql://some-mysql:3306/skywalking \
# -e SW_DATA_SOURCE_USER=skywalking \
# -e SW_DATA_SOURCE_PASSWORD=skywalking \
# -v /tmp/driver:/skywalking/ext-libs \
# -p 12800:12800 \
# -p 11800:11800 \
# apache/skywalking-oap-server:8.7.0-es7

docker run -d \
--name some-skywalking-oap \
--net common-network \
-e SW_STORAGE=elasticsearch7 \
-e SW_STORAGE_ES_CLUSTER_NODES=some-elasticsearch:9200 \
-e JAVA_OPTS=" -Xms512m -Xmx512m " \
-p 12800:12800 \
-p 11800:11800 \
apache/skywalking-oap-server:8.7.0-es7
