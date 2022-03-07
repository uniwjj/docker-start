#!/bin/bash

# 参考地址
# https://hub.docker.com/r/sequenceiq/hadoop-docker

# 端口
# Hdfs ports：50010 50020 50070 50075 50090
# Mapred ports：19888
# Yarn ports：8030 8031 8032 8033 8040 8042 8088

docker run -d \
--name some-hadoop \
-p 9000:9000 \
-p 50010:50010 \
-p 50020:50020 \
-p 50070:50070 \
-p 50075:50075 \
-p 50090:50090 \
-p 19888:19888 \
-p 8030:8030 \
-p 8031:8031 \
-p 8032:8032 \
-p 8033:8033 \
-p 8040:8040 \
-p 8042:8042 \
-p 8088:8088 \
sequenceiq/hadoop:2.9.2

