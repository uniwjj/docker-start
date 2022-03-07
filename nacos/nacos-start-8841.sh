#!/bin/bash

# 参考地址
# https://github.com/nacos-group/nacos-docker
# web访问http://127.0.0.1:8848，账号/密码：nacos/nacos

# 配置参数：
# SERVER_SERVLET_CONTEXTPATH：指定上下文前缀，默认nacos
# NACOS_APPLICATION_PORT：指定端口，默认8848
# SPRING_DATASOURCE_PLATFORM：指定数据源平台，如果使用MySQL，值配置成mysql
# MYSQL_DATABASE_NUM：指定MySQL数据库个数，默认1
# MYSQL_SERVICE_HOST：指定数据库主机
# MYSQL_SERVICE_PORT：指定数据库端口
# MYSQL_SERVICE_DB_NAME：指定库名
# MYSQL_SERVICE_DB_PARAM：指定数据库连接参数
# MYSQL_SERVICE_USER：指定用户名
# MYSQL_SERVICE_PASSWORD：指定密码
# NACOS_AUTH_TOKEN_EXPIRE_SECONDS：指定Token过期时间，默认1800秒
# NACOS_SERVER_IP：多网卡情况下，指定ip或网卡
# PREFER_HOST_MODE：如果支持主机名可以使用hostname，否则使用ip，默认也是ip
# JVM_XMS：-Xms
# JVM_XMX：-Xmx
# JVM_XMN：-Xmn
# JVM_MS：-XX:MetaspaceSize
# JVM_MMS：-XX:MaxMetaspaceSize
# TOMCAT_ACCESSLOG_ENABLED：是否开始tomcat访问日志的记录

# --add-host hostname  可以用来添加主机名
# -h hostname  用于指定主机名

docker run -d \
--name some-nacos-8841 \
--net common-network \
-h some-nacos-8841 \
-e MODE=cluster \
-e PREFER_HOST_MODE=hostname \
-e 'NACOS_SERVERS=some-nacos-8841:8841 some-nacos-8842:8842 some-nacos-8843:8843' \
-e NACOS_APPLICATION_PORT=8841 \
-p 8841:8841 \
-e SPRING_DATASOURCE_PLATFORM=mysql \
-e MYSQL_SERVICE_HOST=some-mysql \
-e MYSQL_SERVICE_PORT=3306 \
-e MYSQL_SERVICE_DB_NAME=nacos \
-e 'MYSQL_SERVICE_DB_PARAM=characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useSSL=false&allowPublicKeyRetrieval=true' \
-e MYSQL_SERVICE_USER=nacos \
-e MYSQL_SERVICE_PASSWORD=nacos \
-e JVM_XMS=256m \
-e JVM_XMX=256m \
-v /tmp/nacos/logs/8841:/home/nacos/logs \
uniwjj/nacos-server-arm:2.0.3

