#!/bin/sh
# 根据实际的节点个数、节点位置，修改下面的配置内容
redis-server /root/redis_cluster/node1/redis.conf &
redis-server /root/redis_cluster/node2/redis.conf &
