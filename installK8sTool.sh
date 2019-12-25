#! /bin/bash

echo "deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main" | sudo tee -a  /etc/apt/sources.list.d/kubernetes.list

curl -s https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | sudo apt-key add -

sudo apt update

sudo apt install -y apt-transport-https ca-certificates software-properties-common -y

sudo apt install -y kubelet=1.15.2-00 kubeadm=1.15.2-00 kubectl=1.15.2-00
