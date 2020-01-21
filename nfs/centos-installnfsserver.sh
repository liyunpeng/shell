#! /bin/bash

set -v
#
# /usr/local/k8s/redis/pv1 192.168.0.211(rw,sync,no_root_squash) 使只能192.168.0.211的主机
# 才能挂在这个网络文件系统， 其他主机不能， 要改为*才能让其他主机挂在
sudo cat << EOF > /tmp/exports 
/usr/local/k8s/redis/pv1 *(rw,sync,no_root_squash)
/usr/local/k8s/redis/pv2 *(rw,sync,no_root_squash)
/usr/local/k8s/redis/pv3 *(rw,sync,no_root_squash)
/usr/local/k8s/redis/pv4 *(rw,sync,no_root_squash)
/usr/local/k8s/redis/pv5 *(rw,sync,no_root_squash)
/usr/local/k8s/redis/pv6 *(rw,sync,no_root_squash)
EOF
sudo cp  /tmp/exports /etc/exports

sudo yum -y install nfs-common nfs-utils rpcbind

sudo mkdir -p /usr/local/k8s/redis/pv{1..6}

# 解决其他主机挂载后，無法寫文件的錯誤
chmod 777 /usr/local/k8s/redis/pv{1..6}

sudo systemctl restart rpcbind
sudo systemctl restart nfs-server
#sudo systemctl enable nfs

sudo exportfs -v
