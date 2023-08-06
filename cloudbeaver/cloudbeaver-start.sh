#!/bin/bash

# 配置地址
# https://github.com/dbeaver/cloudbeaver/wiki/Run-Docker-Container
# https://hub.docker.com/r/dbeaver/cloudbeaver
# 默认账号/密码：cbadmin/cbadmin

docker run -d \
--name some-clouddbeaver \
--net common-network \
-p 8978:8978 \
dbeaver/cloudbeaver:latest

