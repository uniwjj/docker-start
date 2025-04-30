#!/bin/bash

# 参考地址
# https://prestodb.io/docs/current/installation/deploy-docker.html

# 访问presto命令行
# docker exec -it some-presto presto-cli

# 文件密码配置：https://prestodb.io/docs/current/security/password-file.html

ROOT_DIR=$(dirname $0)/
ROOT_DIR=$(cd $ROOT_DIR;pwd)

docker run -d \
--name some-presto \
--net common-network \
-p 8080:8080 \
-v /$ROOT_DIR/conf/config.properties:/opt/presto-server/etc/config.properties \
-v /$ROOT_DIR/conf/jvm.config:/opt/presto-server/etc/jvm.config \
prestodb/presto:latest

