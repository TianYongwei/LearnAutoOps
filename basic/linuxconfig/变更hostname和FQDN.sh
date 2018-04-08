# 0. 编辑/etc/hosts
vim /etc/hosts

192.168.128.12 domain1.com centos69-1

hostname help
hostname -i
hostname -f

# 1.hostname file
vim /etc/sysconfig/network

# 2. hostname is a command. e.g.
hostname centos69-1


# 3. then append "HOSTNAME=centos69-1"

