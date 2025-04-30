#!/bin/bash

# 配置地址
# https://hub.docker.com/r/apache/doris
# 端口说明：8030是HTTP端口，9030是MySQL端口

# 创建网络
# docker network create common-network

# 安装软件
# 安装rzsz、kerberos相关工具，如果安装kerberos工具，会生成/etc/krb5.conf文件，导致文件被覆盖掉，需要检查下
# apt update & apt install -y lrzsz krb5-user

# 设置密码
# 默认没有密码，用户为root，`mysql -h127.0.0.1 -P9030 -uroot`连上Doris，通过`SET PASSWORD = PASSWORD('root')`设置密码


# Hive Catalog配置
# https://doris.apache.org/zh-CN/docs/lakehouse/datalake-analytics/hive
# 创建使用Kerberos认证的Hive Catalog：
# hive.metastore.uris: Hive MetaStore的地址
# hive.metastore.kerberos.principal：Hive MetaStore服务端启动时使用的Principal，这里务必保证和要连的HMS主机名一致，否则会报Kerberos认证失败。比如下面配置，主机名都要是hms1.org，在hive-sie.xml配置文件中
# hadoop.kerberos.keytab：客户端Keytab，会来连接Hive MetaStore、HDFS NN、Yarn ResourceManager，通常是hdfs-site.xml的dfs.namenode.keytab.file配置，需要部署在所有FE和BE节点的相同目录
# hadoop.kerberos.principal：客户端Principal，会来连接Hive MetaStore、HDFS NN、Yarn ResourceManager，通常是hdfs-site.xml的dfs.namenode.kerberos.principal配置
# yarn.resourcemanager.principal：Yarn ResourceManager的principal，可以在yarn-site.xml中获取
# dfs.nameservices：对应core-site.xml中的fs.defaultFS中NameSpace，即去掉协议后的部分，比如hdfs://your-nameservice，值就是your-nameservice
# 
# CREATE CATALOG hive PROPERTIES (
#     'type'='hms',
#     'hive.metastore.uris' = 'thrift://hms1.org:9083',
#     'hive.metastore.sasl.enabled' = 'true',
#     'hive.metastore.kerberos.principal' = 'hive/hms1.org@EXAMPLE.COM',
#     'hadoop.security.authentication' = 'kerberos',
#     'hadoop.kerberos.keytab' = '/etc/security/keytabs/user.keytab',   
#     'hadoop.kerberos.principal' = 'user/dev@EXAMPLE.COM',
#     'yarn.resourcemanager.principal' = 'yarn/yarn-rm1.org@EXAMPLE.COM',
#     'dfs.nameservices'='your-nameservice',
#     'dfs.ha.namenodes.your-nameservice'='nn1,nn2',
#     'dfs.namenode.rpc-address.your-nameservice.nn1'='172.21.0.2:8020',
#     'dfs.namenode.rpc-address.your-nameservice.nn2'='172.21.0.2:8020',
#     'dfs.client.failover.proxy.provider.your-nameservice'='org.apache.hadoop.hdfs.server.namenode.ha.ConfiguredFailoverProxyProvider'
# );

# Catalog元数据缓存
# https://doris.apache.org/zh-CN/docs/lakehouse/metacache
# Doris缓存元数据问题，需要解决，show databses会很慢
# 刷新Catalog、Database、Table
# https://doris.apache.org/zh-CN/docs/lakehouse/metacache

# Doris Hive集成Ranger
# https://doris.apache.org/zh-CN/docs/lakehouse/datalake-analytics/hive#%E9%9B%86%E6%88%90-apache-ranger

# krb5.conf配置
# 可以将krb5.conf配置到/etc/krb5.conf，如果不做全局配置，需要按照FE和BE单独配置
# FE：在fe.conf配置JVM参数-Djava.security.krb5.conf
# BE：在be.conf使用kerberos_krb5_conf_path配置项，默认值为/etc/krb5.conf

# 开启Kerberos Debug日志
# 在FE、BE的Java启动进程中添加下面配置：-Djavax.security.auth.useSubjectCredsOnly=false -Dsun.security.krb5.debug=true，Kerberos日志会输出到控制台中
# 通过docker logs some-doris即可以看到相关日志

# 常见SQL
# 查看所有Catalog：show catalogs;
# 查看Catalog定义：show create catalog hive;
# 切换Catalog：switch catalog;

ROOT_DIR=$(dirname $0)/
ROOT_DIR=$(cd $ROOT_DIR;pwd)

docker run -d \
--name some-doris \
--net common-network \
-e TZ=Asia/Shanghai \
-p 8030:8030 \
-p 9030:9030 \
-v /$ROOT_DIR/conf/krb5.conf:/etc/krb5.conf:ro \
-v /$ROOT_DIR/conf/user.keytab:/etc/security/keytabs/user.keytab:ro \
apache/doris:doris-all-in-one-2.1.0

