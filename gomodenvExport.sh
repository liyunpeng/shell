#!/bin/bash
#功能说明：export出go mod需要的环境变量

#用法 source ~/shell/gomodenvExport.sh

export GO111MODULE="on"
export GOPATH=/home/user1/gomodpath

export CGO_ENABLED="0"
export GOOS="linux"
export GOARCH=amd64
export GOPROXY="https://goproxy.cn"
