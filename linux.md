# Linux 基础知识

#### nohup使用——输出到指定文件

```
nohup java -jar xhwNewKafkaZhiLi--version-weibo.jar > nohup.out 2>&1 &
```

#### alias别名——将长命令换成短命令使用

新建alias

```
alias [短命令]='[长命令]'
```

显示当前会话的alias

```
alias
```

删除当前会话的alias

```
unalias [短命令]
```

**注意**，以上alias设置仅仅会在当前会话生效，比如使用alias设置了别名，重新开启shell会话后就失效了，这个时候的最佳实践是编写~/.bash_alias脚本文件，并让脚本在会话启动的时候执行（添加脚本在.bash_profile中）。

#### 按照名字匹配线程名称并杀死

```
ps -ef|grep xhwDataCenter.jar | grep -v "grep" | awk '{print $2}' | xargs kill -9
```

#### scp 远程拷贝(配合免密登录更方便)

```
scp local_file [remote_username@]remote_ip:remote_folder[/filename]
```

or

```
scp -r local_folder [remote_username@]remote_ip:remote_folder
```

#### 免密登录

本地生成钥匙对

```
语法
ssh-keygen(选项)
选项
-b：指定密钥长度；
-e：读取openssh的私钥或者公钥文件；
-C：添加注释；
-f：指定用来保存密钥的文件名；
-i：读取未加密的ssh-v2兼容的私钥/公钥文件，然后在标准输出设备上显示openssh兼容的私钥/公钥；
-l：显示公钥文件的指纹数据；
-N：提供一个新密语；
-P：提供（旧）密语；
-q：静默模式；
-t：指定要创建的密钥类型。


ssh-keygen -t rsa -C "youremail@email.com" -f ~/.ssh/github_key -P ''
生成新的ssh key并命名为github_key
```

复制生成的公钥到要连接服务器上

```
语法
ssh-copy-id [-i [identity_file]] [user@]machine
选项
-i：指定公钥文件
实例
1、把本地的ssh公钥文件安装到远程主机对应的账户下：

ssh-copy-id user@server
ssh-copy-id -i ~/.ssh/id_rsa.pub user@server
```

> 执行需要目标服务器的用户名和密码,因为是首次
