#! /bin/bash

# sudo yum intall git -y

cat <<EOF>> ~/.bashrc
source <(kubectl completion bash)
alias k=kubectl
alias kd='kubectl describe' 
complete -F __start_kubectl k
EOF

source ~/.bashrc