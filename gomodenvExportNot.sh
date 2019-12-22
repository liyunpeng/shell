#!/bin/bash
# 功能说明：export出go mod需要的环境变量

# 因为shell会启动一个进程， shell里的export对针对本进程的，
# 进程结束了，export的环境变量就不无效了
# 要让export有效， 需要用soure命令
# 用法 soure ~/bin/shell/gomodenvExportNot.sh

export GO111MODULE="off"
export GOPATH=/f/GoWorkSpace/gomodtest/logagent

export CGO_ENABLED="0"
export GOOS="linux"
export GOARCH=amd64
export GOPROXY=""