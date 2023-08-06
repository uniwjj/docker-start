#!/bin/bash

# 配置地址
# https://hub.docker.com/_/mysql?tab=description
# https://hub.docker.com/r/mysql/mysql-server
# https://hub.docker.com/r/ubuntu/mysql

# 参考地址
# https://blog.csdn.net/tyt_xiaotao/article/details/84621087

# 修改权限
# select host,user,plugin,authentication_string from mysql.user; 
# ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'ginger';
# flush privileges;
# 上述执行失败可以用瞎下面这个
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'ginger' WITH GRANT OPTION;
# flush privileges;

# MySQL8无法通过上面方式修改权限，可以采用下面方式
# use mysql;
# update user set host = '%' where user = 'root';
# flush privileges;

# docker network create common-network

# docker run -d \
# --name some-mysql \
# --net common-network \
# -p 3306:3306 \
# -e MYSQL_ROOT_PASSWORD=ginger \
# -e TZ=Asia/Shanghai \
# mysql/mysql-server:8.0.27-1.2.6-server --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci


docker run -d \
--name some-mysql \
--net common-network \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=ginger \
-e TZ=Asia/Shanghai \
mysql/mysql-server:5.7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci




