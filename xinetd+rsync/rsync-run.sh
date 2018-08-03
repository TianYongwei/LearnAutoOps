#!/bin/sh

srcDir=/home/zyyt/rsync_package/
echo 123456 > /pass.wd
chmod 600 /pass.wd
inotifywait -mr --timefmt '%d/%m/%y %H:%M' --format '%T %w %f %e' -e create,modify,delete,move $srcDir |
while read date time dir file event
do
 echo "$dir $file $event begin syncing"
 rsync -avH --port=873 --progress --delete --password-file=/pass.wd  $srcDir mysync@192.168.83.11::test
 rsync -avH --port=873 --progress --delete --password-file=/pass.wd  $srcDir mysync@192.168.83.12::test
 rsync -avH --port=873 --progress --delete --password-file=/pass.wd  $srcDir mysync@192.168.83.13::test
 rsync -avH --port=873 --progress --delete --password-file=/pass.wd  $srcDir mysync@192.168.83.16::test
 rsync -avH --port=873 --progress --delete --password-file=/pass.wd  $srcDir mysync@192.168.83.20::test
 rsync -avH --port=873 --progress --delete --password-file=/pass.wd  $srcDir mysync@192.168.83.21::test
done