#!/bin/bash

# 配置地址
# https://hub.docker.com/u/jupyter
# https://hub.docker.com/r/jupyter/base-notebook

# 访问地址
# http://127.0.0.1:8888

# 访问使用的Token
# $ jupyter notebook list
# Currently running servers:
# http://22653cf0d411:8888/?token=995df6aa893601e95e937e7008061e0669c69bb014a39479 :: /home/jovyan

# 设置sudo
# 方法1. 以root身份启动容器，比如docker run -it --user root jupyter/base-notebook
# 方法2. 以root身份进入容器，为jovyan用户添加sudo权限
# 2a. 以root身份进入容器，docker exec -u root -it <容器名或ID> /bin/bash
# 2b. 修改/etc/sudoers，echo "jovyan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 
# 2b. 也可以usermod -aG sudo jovyan
# 2c. 重启容器

docker run -d \
--name some-jupyter-base \
--net common-network \
-p 8888:8888 \
-e TZ=Asia/Shanghai \
jupyter/base-notebook

