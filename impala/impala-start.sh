#!/bin/bash

# 参考地址
# https://www.rootopen.com/git/5b8ba95564fec049aff8f948

# 端口映射
# 9000: Name Node IPC
# 50010: Data Node Data transfer
# 50020: Data Node IPC
# 50070: Name Node HTTP
# 50075: Data Node HTTP
# 21000: Impala shell
# 21050: Impala JDBC / ODBC
# 25000: Impala Server HTTP
# 25010: Impala State HTTP
# 25020: Impala Catalog HTTP

# 目录
# /var/lib/hadoop-hdfs/cache/hdfs/dfs/name: Namenode data directory
# /data/dn: Datanode block directory

# 启动测试
# docker run --rm  -ti  -p 9000:9000 -p 50010:50010 -p 50020:50020 -p 50070:50070 -p 50075:50075 -p 21000:21000 -p 21050:21050 -p 25000:25000 -p 25010:25010 -p 25020:25020 codingtony/impala /start-bash.sh

# 进入正在运行的impala
# docker exec -it some-impala /bin/bash

# 运行impala shell
# impala-shell -i localhost

docker run --name some-impala -p 9000:9000 -p 50010:50010 -p 50020:50020 -p 50070:50070 -p 50075:50075 -p 21000:21000 -p 21050:21050 -p 25000:25000 -p 25010:25010 -p 25020:25020 -d codingtony/impala

