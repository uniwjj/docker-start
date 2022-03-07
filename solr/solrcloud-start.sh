#!/bin/sh

# 创建网络与ZK共享
# docker network create zk-network

# 创建zk节点，否则集群将无法启动
# create /solr

# 启动后可以创建核心或者集合
# solr@060b206f6c3d:/opt/solr$ solr create -c log_audit -shards 3 -d basic_configs
#
# Connecting to ZooKeeper at some-zookeeper:2181/solr ...
# Uploading /opt/solr/server/solr/configsets/basic_configs/conf for config log_audit to ZooKeeper at some-zookeeper:2181/solr
# 
# Creating new collection 'log_audit' using command:
# http://localhost:8983/solr/admin/collections?action=CREATE&name=log_audit&numShards=3&replicationFactor=1&maxShardsPerNode=3&collection.configName=log_audit
# 
# {
#   "responseHeader":{
#     "status":0,
#     "QTime":2775},
#   "success":{"172.19.0.3:8983_solr":{
#       "responseHeader":{
#         "status":0,
#         "QTime":1606},
#       "core":"log_audit_shard1_replica1"}}}

docker run -d \
-p 8983:8983 \
--net zk-network \
-e ZK_HOST=some-zookeeper:2181/solr \
--name some-solrcloud solr:5.5.2

