#!/bin/bash
#功能说明：export出go mod需要的环境变量

#用法 soure ~/bin/shell/gomodenvExport.sh

export GO111MODULE="on"
export GOPATH=/home/master/gomodpath

export CGO_ENABLED="0"
export GOOS="linux"
export GOARCH=amd64
export GOPROXY="https://goproxy.cn"
