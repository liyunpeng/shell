执行脚本前，需要安装好samba服务器
sudo apt-get install samba samba-common

脚本中的解释：
sudo chmod -R 0777 /home/master 保证用户可以写

sudo service smbd start  如果不行， 用init.d方式
sudo/etc/init.d/smbd start

其他：
初始设置root密码
master@etcd0:~/k8s/samba$ sudo passwd root
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully


