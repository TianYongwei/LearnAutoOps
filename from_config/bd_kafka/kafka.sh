同样的套路
1.安装
2.配置
3.命令行客户端测试
4.程序客户端测试

(注意：kafka的安装包中包含了zookeeper，可以不用这个用自己安装的。)
# 命令行客户端测试
# 创建topic
kafka-topics.sh --create --zookeeper localhost:2181  --replication-factor 1 --partitions 1 --topic test

kafka-topics.sh --create --zookeeper localhost:2181  --replication-factor 1 --partitions 1 --topic kafkaspout_topic

# 显示已经创建的topic
kafka-topics.sh --list --zookeeper localhost:2181

# 生产者生产数据
kafka-console-producer.sh --broker-list localhost:9092 --topic test

# 消费者消费数据（命令行客户端只能从最开始消费数据）
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning

# 集群中创建topic
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 1 --topic my-replicated-topic

# 查看topic描述
kafka-topics.sh --describe --zookeeper localhost:2181 --topic my-replicated-topic

145653043 中国美术高考网

145653042 美国