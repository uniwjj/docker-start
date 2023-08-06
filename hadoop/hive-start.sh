#!/bin/bash

# 各个端口用途
# 8000：Hive Server默认调试端口
# 8020：NN，fs.defaultFS 接收Client连接的RPC端口，用于获取文件系统metadata信息
# 8030：RM，yarn.resourcemanager.scheduler.address scheduler组件的IPC端口 
# 8031：RM，yarn.resourcemanager.resource-tracker.address IPC 
# 8032：RM，yarn.resourcemanager.address RM的applications manager(ASM)端口 
# 8033：RM，yarn.resourcemanager.admin.address IPC 
# 8040：NM，yarn.nodemanager.localizer.address localizer IPC 
# 8041：NM，yarn.nodemanager.address NM中container manager的端
# 8042：NM，yarn.nodemanager.webapp.address http服务端口 
# 8088：RM，yarn.resourcemanager.webapp.address http服务端口 
# 8480：JN，dfs.journalnode.http-address HTTP服务 
# 8485：JN，dfs.journalnode.rpc-address RPC服务 
# 9083：HMS，/etc/default/hive-metastore中export PORT=来更新默认端口 
# 10000：Hive Server2，/etc/hive/conf/hive-env.sh中export HIVE_SERVER2_THRIFT_PORT=来更新默认端口 
# 10020：JobHistory，mapreduce.jobhistory.address IPC
# 10002：自定义配置的Hive Web端口
# 19888：JobHistory，mapreduce.jobhistory.webapp.address http服务端口
# 50010：DN，dfs.datanode.address datanode服务端口
# 50020：DN，dfs.datanode.ipc.address ipc服务的端口
# 50070：NN，dfs.namenode.http-address http服务的端口
# 50075：DN，dfs.datanode.http.address http服务的端口
# 50470：NN，dfs.namenode.https-address https服务的端口 
# 50475：DN，dfs.datanode.https.address https服务的端口

# docker run -d \
# --name some-hive \
# -p 8000:8000 \
# -p 9000:9000 \
# -p 50010:50010 \
# -p 50020:50020 \
# -p 50070:50070 \
# -p 50075:50075 \
# -p 50090:50090 \
# -p 19888:19888 \
# -p 8030:8030 \
# -p 8031:8031 \
# -p 8032:8032 \
# -p 8033:8033 \
# -p 8040:8040 \
# -p 8042:8042 \
# -p 8088:8088 \
# -p 9083:9083 \
# -p 10000:10000 \
# -p 10002:10002 \
# uniwjj/hive:2.3.7

docker run -d \
--name some-hive \
--net common-network \
-p 8000:8000 \
-p 50070:50070 \
-p 10000:10000 \
-p 10002:10002 \
uniwjj/hive:2.3.7


