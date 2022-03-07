#!/bin/sh

# https://blog.csdn.net/mylitboy/article/details/88865428
# 配置LDAP组织者：-e LDAP_ORGANISATION="beidou"
# 配置LDAP域：-e LDAP_DOMAIN="beidou.com"
# 配置LDAP密码：-e LDAP_ADMIN_PASSWORD="ginger"
# 默认登录用户名：admin
# 8080端口用户容器间连接，给客户端使用，外部占用8080，内部使用80

docker run -d \
           -p 389:389 \
           -p 8080:80 \
           --name some-ldap-server \
           -h openldap-host \
           -e LDAP_ORGANISATION="beidou" \
           -e LDAP_DOMAIN="beidou.com" \
           -e LDAP_ADMIN_PASSWORD="ginger" \
           osixia/openldap


