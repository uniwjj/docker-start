#!/bin/bash

# 参考地址
# https://prestodb.io/docs/current/installation/deploy-docker.html

# 访问presto命令行
# docker exec -it some-presto presto-cli

# 文件密码配置：https://prestodb.io/docs/current/security/password-file.html

docker run -d \
--name some-presto \
--net common-network \
-p 8080:8080 \
-v ./config.properties:/opt/presto-server/etc/config.properties \
-v ./jvm.config:/opt/presto-server/etc/jvm.config \
prestodb/presto:latest

