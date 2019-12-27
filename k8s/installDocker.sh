#! /bin/bash

curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add

sudo add-apt-repository "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update

sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

sudo apt install docker-ce=18.06.1~ce~3-0~ubuntu

sudo systemctl enable docker
