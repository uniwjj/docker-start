#!/bin/bash

# 配置地址
# https://hub.docker.com/u/jupyter
# https://hub.docker.com/r/jupyter/nbviewer

# 访问地址
# http://127.0.0.1:8080

docker run -d \
--name some-jupyter-nbviewer \
--net common-network \
-p 8080:8080 \
-e TZ=Asia/Shanghai \
jupyter/nbviewer

