#! /bin/bash

username=`ls /home/`
sudo apt-get install git -y
sudo apt-get install vim -y
sudo apt-get install curl -y
sudo apt-get install dos2unix -y

git config --global user.email "kylin@126.com"
git config --global user.name ${username} 

sudo cat << EOF >> /home/${username}/.bashrc
GOROOT=/home/master/go/go/
export GOROOT=/home/master/go/go/
alias ll="ls -l"
alias k="kubectl"
EOF
