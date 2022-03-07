#!/bin/bash

# 参考地址
# https://hub.docker.com/r/minio/minio
# https://www.jianshu.com/p/52dbc679094a

# 创建网络
# docker network create common-network
# Console endpoint should use --console-address ":PORT" to choose a static port.

docker run -d \
--name some-minio \
--log-opt max-size=10m \
--log-opt max-file=3 \
-p 9000:9000 \
-p 9090:9090 \
-e "MINIO_ACCESS_KEY=root" \
-e "MINIO_SECRET_KEY=gingerginger" \
-v /tmp/minio/data:/data \
-v /tmp/minio/config:/root/.minio \
minio/minio server /data --console-address ":9090"

