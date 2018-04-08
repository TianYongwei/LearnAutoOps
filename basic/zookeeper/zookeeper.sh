# 0. zookeeper core concept
# 1. download and unpack
# 2. some configurations
# 3. test by command line client
# 4. test by program(e.g. java) client
# 5. test performance by program client

# zookeeper core concept
1. znode and ensemble
2. hierarchal namespace like a tree(in memory)
3. As long as a majority of the servers are available, the ZooKeeper service will be available．
4. A replicated group of servers in the same application is called a quorum

# download and unpack
# version 3.4.10 a latest stable version(2017-09-25)
# url:https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz

# some configurations
conf/zoo.cfg
---
tickTime=2000
dataDir=/var/lib/zookeeper
clientPort=2181

server.1=CentOS69-1:2888:3888
server.2=CentOS69-2:2888:3888
server.3=CentOS69-3:2888:3888

这个地方不要忘记开放系统之间的端口，一共需要开三个端口。
zookeeper启动的日志在zookeeper的根目录，名字是zookeeper.out，这里能看出来为什么没有启动成功。
