#! /bin/bash

git config --global user.email "kylin@126.com"
git config --global user.name ${USER}

# 新系统， 一键安装需要的工具 和需要创建的文件
sudo apt-get install vim -y 

sudo apt-get install net-tools -y 

sudo apt-get install sysstat  -y 

sudo apt-get install psmisc -y 

sudo apt-get install  nethogs -y 

sudo apt-get install  bash-completion -y 

mkdir ~/go_path

mkdir ~/bin

cd ~/bin

git clone https://github.com/liyunpeng/shell.git

cd 

git clone https://github.com/liyunpeng/k8s_yaml.git
	
