#!/bin/bash

# 配置地址
# https://www.oceanbase.com/docs/community-observer-cn-10000000000014793
# https://hub.docker.com/r/oceanbase/oceanbase-ce

# MySQL8无法通过上面方式修改权限，可以采用下面方式
# use mysql;
# update user set host = '%' where user = 'root';
# flush privileges;

# docker network create common-network

docker run -d \
--name some-oceanbase \
--net common-network \
-p 2881:2881 \
-e MINI_MODE=1 \
oceanbase/oceanbase-ce:3.1.4


