#!/bin/bash

# 创建共享网络
# docker network create zk-network

# 参考资料
# https://juejin.cn/post/6877734248195817486
# https://blog.csdn.net/suo082407128/article/details/108445376

# 创建topic
# docker exec some-kafka kafka-topics.sh --create --topic topic名称 --partitions 1 --zookeeper some-zookeeper:2181 --replication-factor 1
# 查询topic
# docker exec some-kafka kafka-topics.sh --list --zookeeper some-zookeeper:2181 

docker run -d \
--restart always \
--net zk-network \
-p 9092:9092 \
-e KAFKA_ZOOKEEPER_CONNECT=some-zookeeper:2181 \
-e KAFKA_ADVERTISED_HOST_NAME=127.0.0.1 \
-e KAFKA_ADVERTISED_PORT=9092 \
--name some-kafka wurstmeister/kafka

