#! /bin/bash

# sudo yum intall git -y
sudo yum install make gcc -y

 sudo dnf install redhat-rpm-config -y
cat <<EOF>> ~/.bashrc
source <(kubectl completion bash)
alias k=kubectl
alias kd='kubectl describe' 
complete -F __start_kubectl k
EOF

sudo sed -i '/swap/ s/^/#/' /etc/fstab

sudo systemctl set-default multi-user.target

git config --global user.email "you@example.com"
git config --global user.name "ljc"

source ~/.bashrc
