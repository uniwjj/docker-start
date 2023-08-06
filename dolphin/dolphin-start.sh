#!/bin/bash

# 参考地址
# https://hub.docker.com/r/apache/dolphinscheduler
# https://dolphinscheduler.apache.org/en-us/docs/3.1.6/guide/start/docker

# 访问
#  http://localhost:12345/dolphinscheduler/ui
# 用户名：admin
# 密码：dolphinscheduler123

docker run -d \
--name some-dolphin \
--net common-network \
-p 12345:12345 \
-p 25333:25333 \
apache/dolphinscheduler-standalone-server:3.1.6


