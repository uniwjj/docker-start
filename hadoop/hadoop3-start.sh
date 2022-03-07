#!/bin/bash

# 参考地址
# https://medium.com/analytics-vidhya/hadoop-single-node-cluster-on-docker-e88c3d09a256
# https://github.com/rancavil/hadoop-single-node-cluster
# https://github.com/bbonnin/docker-hadoop-3

docker run -it \
--name some-hadoop3 \
-p 9864:9864 \
-p 9870:9870 \
-p 8088:8088 \
--hostname hadoop3 hadoop:3.3.0


