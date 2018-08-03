#!/bin/sh

echo '请输入密码：'
sudo su -

service iptables status
service iptables stop


yum -y install rsync xinetd


echo '# default: off
# description: The rsync server is a good addition to an ftp server, as it \
# allows crc checksumming etc.
service rsync
{
        disable = no
        flags           = IPv6
        socket_type     = stream
        wait            = no
        user            = root
        server          = /usr/bin/rsync
        server_args     = --daemon
        log_on_failure  += USERID
}' > /etc/xinetd.d/rsync


echo 'log file = /var/log/rsyncd.log
pid file = /var/run/rsyncd.pid
lock file = /var/run/rsync.lock
[test]
   path = /home/zyyt/rsync_package
   comment = GenuisServer
   uid = root
   gid = root
   port = 873
   read only = no
   list = yes
   auth users = mysync
   secrets file = /etc/rsyncd.scrt' > /etc/rsyncd.conf


echo 'mysync:123456' > /etc/rsyncd.scrt


chmod 600 /etc/rsyncd.conf
chmod 600 /etc/rsyncd.scrt


service xinetd restart
service xinetd status