#!/bin/bash

# 为storm集群创建文件夹
cd /home/
mkdir tyw
cd /home/tyw
mkdir cluster
cd /home/tyw/cluster

# 下载并解压文件
wget https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.4.11/zookeeper-3.4.11.tar.gz
wget http://mirrors.tuna.tsinghua.edu.cn/apache/storm/apache-storm-1.2.1/apache-storm-1.2.1.tar.gz

tar -xvf zookeeper-3.4.11.tar.gz
tar -xvf apache-storm-1.2.1.tar.gz
