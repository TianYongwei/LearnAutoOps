### 1、本地生成钥匙对
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


ssh-keygen -t rsa -C "youremail@email.com" -f ~/.ssh/second -P ''
生成新的ssh key并命名为second

### 2、复制生成的公钥到要连接服务器上
语法
ssh-copy-id [-i [identity_file]] [user@]machine
选项
-i：指定公钥文件
实例
1、把本地的ssh公钥文件安装到远程主机对应的账户下：

ssh-copy-id user@server
ssh-copy-id -i ~/.ssh/id_rsa.pub user@server

> 执行需要目标服务器的用户名和密码,因为是首次
