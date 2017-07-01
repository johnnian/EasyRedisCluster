# EasyRedisCluster

在平时的项目中，经常需要搭建 RedisCluster，需要各种配置，索性把一些常用的配置、执行的命令写成了一份脚本，方便快速使用。

### 相关说明

1. 支持的操作系统：
    - CentOS 6、7
    - MacOS

2. Redis版本：使用官方稳定版本—3.2.9，在稳定版本的基础上编译；

3. 部署节点：使用最小节点部署，3个节点，每个节点上部署两个 Redis 实例（同一主机，监听两个端口）

### 使用说明

下面是 Redis Cluster 的安装步骤（以CentOS环境下的使用为例， MacOS下配置Ruby、环境变量的方法类似）：

#### 步骤1：拷贝安装包到 home 目录

1、拷贝 redis_cluster.tar.gz 到 home目录；

2、解压到 home 目录：
```
[root@ec7e56056c01 ~]# tar -zxvf redis_cluster.tar.gz
```

3、添加到环境变量
```
[root@ec7e56056c01 bin]# vi /etc/bashrc
#Redis Cluster config
REDIS_CLUSTER_HOME=/root/redis_cluster
PATH=$REDIS_CLUSTER_HOME/bin:$PATH
export PATH REDIS_CLUSTER_HOME

[root@ec7e56056c01 bin]# source /etc/bashrc
```

#### 步骤2：安装 Ruby 环境

*注：MacOS 下，可以用 Homebrew 安装 Ruby*

```
[root@ec7e56056c01 ~]# yum -y install ruby
[root@ec7e56056c01 ~]# yum -y install rubygems
[root@ec7e56056c01 ~]# gem install redis  #这一步安装会慢一些
```

#### 步骤3：配置集群

1、修改每个节点的配置信息

*注：假设需要在同一台机子上部署更多节点，可以复制一份为nodeX，修改对应的端口，nodes.conf 位置。*

```
[root@ec7e56056c01 ~]# vi redis_cluster/node1/redis.conf
port 7000
cluster-enabled yes
cluster-config-file /root/redis_cluster/node1/nodes.conf
cluster-node-timeout 5000
appendonly yes

[root@ec7e56056c01 ~]# vi redis_cluster/node2/redis.conf
port 7001
cluster-enabled yes
cluster-config-file /root/redis_cluster/node2/nodes.conf
cluster-node-timeout 5000
appendonly yes
```

2、分别启动每个节点的Redis

*注：请根据实际的节点，修改下 start.sh 的内容*

```
[root@ec7e56056c01 ~]# ./redis_cluster/start.sh
```

3、选择任意一个节点，配置集群启动脚本信息，并且执行

*注：将下面的IP改为真实的内网IP地址*

```
[root@ec7e56056c01 ~]# vi redis_cluster/first_init_cluster.sh
#!/bin/sh
redis-trib.rb create --replicas 1 172.17.0.1:7000 172.17.0.1:7001 172.17.0.2:7002 172.17.0.2:7003 172.17.0.3:7004 172.17.0.3:7005

[root@ec7e56056c01 ~]# ./redis_cluster/first_init_cluster.sh
```
