#!/bin/sh
redis-server /root/redis_cluster/node1/redis.conf &
redis-server /root/redis_cluster/node2/redis.conf &
