#!/bin/bash

# 参考地址
# https://hub.docker.com/r/gcavalcante8808/krb5-server

docker run -d \
--name some-krb5-server \
-h krb5-server.pc \
-e KRB5_REALM=beidou.com \
-e KRB5_KDC=krb5-server.pc \
-e KRB5_PASS=ginger \
-p 88:88 \
-p 464:464 \
-p 749:749 \
gcavalcante8808/krb5-server

