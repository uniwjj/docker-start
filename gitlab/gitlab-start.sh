#!/bin/bash

# 参考地址
# https://docs.gitlab.com/omnibus/docker/
# https://hub.docker.com/r/gitlab/gitlab-ce

# docker run --detach \
# --hostname gitlab.example.com \
# --publish 443:443 --publish 80:80 --publish 22:22 \
# --name gitlab \
# --restart always \
# --volume $GITLAB_HOME/config:/etc/gitlab \
# --volume $GITLAB_HOME/logs:/var/log/gitlab \
# --volume $GITLAB_HOME/data:/var/opt/gitlab \
# gitlab/gitlab-ee:latest

# 重置密码
# 进入容器
# docker exec -it some-gitlab /bin/bash
# 进入控制台
# gitlab-rails console -e production
# 查询root用户
# user=User.where(id:1).first
# 设置密码
# user.password='ginger'
# 保存
# user.save!
# 退出
# exit


docker run -d \
--name some-gitlab \
-p 443:443 \
-p 80:80 \
-p 2222:22 \
gitlab/gitlab-ce:latest


