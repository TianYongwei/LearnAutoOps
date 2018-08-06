# Linux 基础知识

#### nohup使用——输出到指定文件

``` shell
nohup [command line] > nohup.out 2>&1 &
```

#### alias别名——将长命令换成短命令使用

新建alias

``` shell
alias [短命令]='[长命令]'
```

显示当前会话的alias

``` shell
alias
```

删除当前会话的alias

``` shell
unalias [短命令]
```

**注意**，以上alias设置仅仅会在当前会话生效，比如使用alias设置了别名，重新开启shell会话后就失效了，这个时候的最佳实践是编写~/.bash_alias脚本文件，并让脚本在会话启动的时候执行（添加脚本在.bash_profile中）。

#### 按照名字匹配线程名称并杀死

``` shell
ps -ef|grep [thread_name] | grep -v "grep" | awk '{print $2}' | xargs kill -9
```

#### scp 远程拷贝(配合免密登录更方便)

``` shell
scp local_file [remote_username@]remote_ip:remote_folder[/filename]
```

or

``` shell
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

#### 会话session概念和.bash_xx文件的含义

新建会话默认执行 ~/.bash_profile，这时候涉及到 Bash 的初始化流程，交互模式和非交互模式下的初始化流程是不一样的，这部分待深究。

> Linux 系统的一种 Shell 程序，其他常见的还有zsh等

---

.bash_profile 脚本 1. 初始化了一些变量比如 JAVA_HOME，2. 执行了一些命令 3. 执行了一下脚本 这三点也是任何脚本都能做到的事情。究其本质为什么会执行 .bash_profile 脚本，恐怕是Bash shell 这个软件本身的默认设置吧。

以下是我 MacOS 的 ~/.bash_profile 文件

``` shell
# mysql
export PATH=/usr/local/mysql/bin:$PATH

# maven
export M2_HOME=/Users/tianyongwei/dev/java/apache-maven-3.5.2
export PATH=$PATH:$M2_HOME/bin

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/
export PATH=$PATH:$JAVA_HOME/bin

# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# 执行别名设定 ~/.bash_alias
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```

#### Bash shell 的几个关键字

常用搭配，echo > 往文件中写字符

```
echo '你好，世界!' > ./helloworld.txt 
```

export 能临时定义变量

> 之所以每次打开shell都能执行Java ,是因为每次豆浆 Java 的执行路径放到了 path 这个全局变量中了

``` shell
export PATH=$PATH:$JAVA_HOME/bin
```

> 取全局变量用 `$`


