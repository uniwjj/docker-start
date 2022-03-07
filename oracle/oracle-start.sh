#!/bin/bash

# 参考地址
# https://hub.docker.com/r/absolutapps/oracle-12c-ee
# https://my.oschina.net/u/3446722/blog/983745

# 授权配置
# 1. 登录oracle用户，su oracle
# 2. 启动命令行，sqlplus
# 3. 账号密码登录，sys/oracle或者system/oracle

docker run -d \
--name some-oracle \
--privileged \
-p 9090:8080 \
-p 1521:1521 \
absolutapps/oracle-12c-ee


