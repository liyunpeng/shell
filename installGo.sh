#! /bin/bash
set -v 

fileName="/usr/local/go"

if test -e $fileName  
then
    echo '文件已存在!'
else
    echo '文件不存在!'
	wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz
	tar -C /usr/local -zxvf go1.13.linux-amd64.tar.gz
fi


count=`grep -c "go\/bin"  ~/.bashrc` 
if [ $count -eq '0' ] 
then
	cat <<EOF>> ~/.bashrc
	export GOROOT=/usr/local/go
	export GOPATH=$HOME/go
	export PATH=$PATH:/usr/local/go/bin
	# export PATH=$(echo $PATH | tr : "\n"| sort | uniq | tr "\n" :)
# 结尾的EOF必须顶格写,否则语法错误
EOF

fi 

source ~/.bashrc
