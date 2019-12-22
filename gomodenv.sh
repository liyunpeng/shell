#!/bin/bash
#功能说明：export出go mod需要的环境变量

#参数说明：参数1是制定模式

mod=$1

export CGO_ENABLED="0"
export GOOS="linux"
export GOARCH=amd64

if [ $mod == "mod" ]
then
	echo "export go mod env"
	export GO111MODULE="on"
	export GOPATH=/e/GoModPath
	export GOPROXY="https://goproxy.io"
elif [ $mod == "notmod"  ]
then
	echo "export go not mod env"
	export GO111MODULE="off"
	export GOPATH="F:\GoWorkSpace\logagent"
else
	echo "argument wrong"
fi


