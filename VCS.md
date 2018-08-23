#### 安装git 安装本版高一点的git

### 生成公钥密钥对(下面这个命令相对比较复杂，不带任何参数的时候就会出现交互式输入对话)
ssh-keygen -f keyname -C "key comment"

### git 常用命令
git clone git@github.com:apache/storm.git
git add ./
git commit -c "comment"
git push


### 遇见了提交了代码profile页面不现实今天的提交记录的问题（方格图）

### 显示git config
git config --list
git config user.name
git config user.name tyw
git config user.email
git config user.email 869358189@qq.com

git config -global XXX

### SVN

[参考:svn-book](http://svnbook.red-bean.com/en/1.7/index.html)

1. 查看当前目录下的所有 ignore 文件, -R 表示递归。

```
svn propget svn:ignore  [file_path] -R

eg.
svn propget svn:ignore  ./ -R
```

2. 添加 ignore 文件

```
svn propset svn:ignore '[不带斜线的文件或文件夹名称（多个用空格隔开）]' [文件夹路径]

eg.
svn propset svn:ignore 'target' ./
```

3. commit log

4. 回滚


### svn 疑难杂症

```
[root@web120 bangdan-node]# svn up
正在升级 '.':
svn: E170013: Unable to connect to a repository at URL 'https://120.27.99.222/svn/pubsafe/bangdan/bangdan-node'
svn: E175013: 禁止访问 '/svn/pubsafe/bangdan/bangdan-node'
```

方案：删除~/.subversion/auth 目录，清楚登录信息，重新登录