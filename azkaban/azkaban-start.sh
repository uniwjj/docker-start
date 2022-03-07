#!/bin/sh

# 参考资料
# https://hub.docker.com/r/inovvo/azkaban-base
# https://hub.docker.com/r/inovvo/azkaban-standalone
# https://github.com/inovvo-com/azkaban
# 用户名和密码：azkaban/azkaban
# 数据库用户名和密码：root/my-secret-pw

docker run \
-d \
-p 8443:8443 \
-p 8081:8081 \
-p 5005:5005 \
--name some-azkaban inovvo/azkaban-standalone:latest

