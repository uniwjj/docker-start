#!/bin/bash

# 参考地址
# https://docs.gitlab.com/omnibus/docker/

# docker run --detach \
# --hostname gitlab.example.com \
# --publish 443:443 --publish 80:80 --publish 22:22 \
# --name gitlab \
# --restart always \
# --volume $GITLAB_HOME/config:/etc/gitlab \
# --volume $GITLAB_HOME/logs:/var/log/gitlab \
# --volume $GITLAB_HOME/data:/var/opt/gitlab \
# gitlab/gitlab-ee:latest


docker run -d \
--name some-gitlab \
-p 443:443 \
-p 80:80 \
-p 2222:22 \
gitlab/gitlab-ce:latest


