#!/bin/bash

# 参考地址
# https://github.com/nacos-group/nacos-docker
# web访问http://127.0.0.1:8848，账号/密码：nacos/nacos
# 8848为服务的端口
# 9848为客户端gRPC请求服务端端口，用于客户端向服务端发起连接和请求，固定偏移1000，即8848+1000
# 9849为服务端gRPC请求服务端端口，用于服务间同步等，固定偏移1001，即8848+1001

# 配置参数：
# SERVER_SERVLET_CONTEXTPATH：指定上下文前缀，默认nacos
# NACOS_APPLICATION_PORT：指定端口，默认8848
# NACOS_AUTH_ENABLE：是否开启权限，默认false
# NACOS_AUTH_TOKEN_EXPIRE_SECONDS：token失效时间，默认18000秒
# NACOS_AUTH_TOKEN：token，默认SecretKey012345678901234567890123456789012345678901234567890123456789
# NACOS_AUTH_CACHE_ENABLE：权限缓存开关 ,开启后权限缓存的更新默认有15秒的延迟，默认false
# SPRING_DATASOURCE_PLATFORM：指定数据源平台，如果使用MySQL，值配置成mysql
# MYSQL_DATABASE_NUM：指定MySQL数据库个数，默认1
# MYSQL_SERVICE_HOST：指定数据库主机
# MYSQL_SERVICE_PORT：指定数据库端口
# MYSQL_SERVICE_DB_NAME：指定库名
# MYSQL_SERVICE_DB_PARAM：指定数据库连接参数
# MYSQL_SERVICE_USER：指定用户名
# MYSQL_SERVICE_PASSWORD：指定密码
# NACOS_AUTH_TOKEN_EXPIRE_SECONDS：指定Token过期时间，默认1800秒

docker run -d \
--name some-nacos-mysql \
--net common-network \
-e MODE=standalone \
-p 8848:8848 \
-e SPRING_DATASOURCE_PLATFORM=mysql \
-e MYSQL_SERVICE_HOST=some-mysql \
-e MYSQL_SERVICE_PORT=3306 \
-e MYSQL_SERVICE_DB_NAME=nacos \
-e 'MYSQL_SERVICE_DB_PARAM=characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useSSL=false&allowPublicKeyRetrieval=true' \
-e MYSQL_SERVICE_USER=nacos \
-e MYSQL_SERVICE_PASSWORD=nacos \
uniwjj/nacos-server-arm:2.0.3


# docker run -d \
# --name some-nacos \
# -e MODE=standalone \
# -p 8848:8848 \
# -p 9848:9848 \
# uniwjj/nacos-server-arm:2.0.3


# docker run -d \
# --name some-nacos \
# -e MODE=standalone \
# -p 8848:8848 \
# -p 9848:9848 \
# nacos/nacos-server:2.0.3

