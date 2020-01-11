#! /bin/bash
memTotal=`grep MemTotal /proc/meminfo`

echo "物理总内存="$memTotal

memFree=`grep MemFree /proc/meminfo`
echo "物理剩余内存="$memFree

version=`cat /proc/version`
echo "内核版本与操作系统="$version

cpuNum=`cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l`
echo "cpu数目="$cpuNum

coresNum=`cat /proc/cpuinfo| grep "cpu cores"| uniq`
echo "一个cpu上的核数="$coresNum

coresFreq=`cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c`
echo "一个cpu上的核数和cpu型号和每个核的频率="$coresFreq
