#! /bin/bash

function fun1(){
name=$1
service_pid=`ps -ef | grep $name | grep -v grep | awk '{print $2}'`
echo "需要结束的进程ID为：$service_pid"

for id in $service_pid
do
   #sudo -u lyy    kill -9 $id
   echo "结束进程: " + $service_pid
   # kill -9 $id
done
}

server_api="http://10.10.11.39:3456"
ps -ef | grep lotus

mod=$1
case $mod in
"l")
  fun1 "lotus.log"
  nohup ./lotus daemon --server-api=$server_api --bootstrap=false --api 11234 > lotus.log 2>&1 &
;;

"p")
  fun1 "poster.log"
  TRUST_PARAMS=1 RUST_LOG=info RUST_BACKTRACE=1 nohup ./lotus-storage-miner run --mode=remote-wdposter --server-api=$server_api--dist-path=/mnt --nosync > poster.log 2>&1 &
;;

"s")
  fun1 "sealer.log"
  FORCE_BUILDER_P1_WORKERS=1 FORCE_BUILDER_TASK_DELAY=25m TRUST_PARAMS=1 RUST_LOG=info RUST_BACKTRACE=1 FORCE_BUILDER_TASK_TOTAL_NUM=2 nohup ./lotus-storage-miner run --mode=remote-sealer --server-api=$server_api --dist-path=/mnt --nosync --groups=1 > sealer.log 2>&1 &
;;

"f")
  fun1 "force-remote-worker"
  RUST_LOG=debug BELLMAN_PROOF_THREADS=3 RUST_BACKTRACE=1 nohup ./force-remote-worker > force-remote-worker.log 2>&1 &
;;

"sv")
  fun1 "lotus-server"
  nohup ./lotus-server >lotus-server.log 2>&1 &
;;
esac


echo "运行后"
ps -ef | grep lotus