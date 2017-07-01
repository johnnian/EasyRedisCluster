#!/bin/sh
# 根据实际情况，删除多余的节点信息
rm /root/redis_cluster/node1/nodes.conf
rm /root/redis_cluster/node2/nodes.conf
rm *.aof *.rdb
