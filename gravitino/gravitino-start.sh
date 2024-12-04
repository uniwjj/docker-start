#!/bin/bash

# 参考地址
# https://gravitino.apache.org/downloads/
# docker network create common-network

docker run -d \
--name some-gravitino \
--net common-network \
-p 8090:8090 \
apache/gravitino:latest

