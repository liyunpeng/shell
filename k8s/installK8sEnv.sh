#! /bin/bash

# 集群里每个node服务器的时区需要设置相同，强制更改时区为上海
sudo ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
sudo bash -c "echo 'Asia/Shanghai' > /etc/timezone"


sudo apt-get install -y ntpdate

# 使用阿里云的时间服务器更新
sudo ntpdate ntp1.aliyun.com

sudo ufw disable

setenforce 0

sudo sed -i '/swap/ s/^/#/' /etc/fstab

sudo swapoff -a
