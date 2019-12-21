
master@etcd0:~/k8s/samba$ sudo passwd root
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
sudo service smbd start  如果不行， 用init.d方式
sudo/etc/init.d/smbd start
