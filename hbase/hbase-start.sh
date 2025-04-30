#!/bin/bash

# 参考地址
# https://hub.docker.com/r/dajobe/hbase
# https://github.com/johnnian/Blog/issues/38

# 监控信息
# http://localhost:16010/master-status
# http://localhost:16010/zk.jsp
# http://localhost:8085/rest.jsp

# 16000为hbase.master.port，160102为hbase.master.info.port，
# 16020为hbase.regionserver.port，2181为hadoop.registry.zk.quorum
# 注意，9090端口会与oracle端口冲突，因此，连接时需要错开端口

docker run -d \
--name some-hbase \
-p 16000:16000 \
-p 16010:16010 \
-p 16020:16020 \
-p 9090:9090 \
-p 2181:2181 \
-p 8085:8085 \
dajobe/hbase


