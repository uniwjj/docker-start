#!/bin/sh

# https://blog.csdn.net/mylitboy/article/details/88865428
# 端口使用8080，使用容器连接，在Server端容器中配置

docker run -d \
--rm \
--privileged \
--name some-ldap-client \
--net=container:some-ldap-server \
-e PHPLDAPADMIN_HTTPS=false \
-e PHPLDAPADMIN_LDAP_HOSTS=127.0.0.1 \
osixia/phpldapadmin

