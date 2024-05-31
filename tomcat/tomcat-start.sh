#!/bin/bash

# 参考地址
# https://hub.docker.com/_/tomcat/tags?page=1&name=jdk8

docker run -d \
--name some-tomcat \
-p 8080:8080 \
-e TZ=Asia/Shanghai \
tomcat:9.0.86-jdk8

