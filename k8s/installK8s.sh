#! /bin/bash

mkdir ~/k8s_log

sudo kubeadm init --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.15.2 --pod-network-cidr=192.169.0.0/16 2>&1 | tee ~/k8s_log/kubeadm_init_log.txt
 
#sudo kubeadm init --image-repository registry.aliyuncs.com/google_containers \
#	--kubernetes-version v1.15.2 \ 
#	--pod-network-cidr=192.169.0.0/16 
#	2>&1 | tee ~/k8s_log/kubeadm_init_log.txt

sudo rm $HOME/.kube -rf
mkdir -p $HOME/.kube
chown master.master  $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f http://mirror.faasx.com/k8s/calico/v3.3.2/rbac-kdd.yaml >> ~/k8s_log/kubeadm_init_log.txt


kubectl apply -f http://mirror.faasx.com/k8s/calico/v3.3.2/calico.yaml >> ~/k8s_log/kubeadm_init_log.txt


kubectl get node >> ~/k8s_log/kubeadm_init_log.txt



