# EasyRedisCluster

在平时的项目中，经常需要搭建 RedisCluster，需要各种配置，索性把一些常用的配置、执行的命令写成了一份脚本，方便快速使用。

### 相关说明

1. 支持的操作系统：
    - CentOS 6、7
    - MacOS

2. Redis版本：使用官方稳定版本—3.2.9，在稳定版本的基础上编译；

3. 部署节点：使用最小节点部署，3个节点，每个节点上部署两个 Redis 实例（同一主机，监听两个端口）

### 使用说明

请看这里（CentOS下生产实战）：[生产环境下部署Redis Cluster集群](https://github.com/johnnian/Blog/issues/9)

