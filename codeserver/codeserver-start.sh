#!/bin/sh

# https://hub.docker.com/r/linuxserver/code-server
# https://hub.docker.com/r/codercom/code-server

# docker run -d \
# -p 8080:8080 \
# --name some-codeserver \
# codercom/code-server:latest

docker run -d \
--name some-codeserver \
-e PUID=1000 \
-e PGID=1000 \
-e TZ=Etc/UTC \
-e PASSWORD=easydata \
-e DEFAULT_WORKSPACE=/data \
-p 8443:8443 \
lscr.io/linuxserver/code-server:latest


