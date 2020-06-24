#!/bin/bash
function func1() {
path=$1
ssh -p 62534 $path > /dev/null 2>&1 << eeooff
ps aux|grep force | grep -v grep  > /home/fil/1.txt
exit
eeooff

scp -rpP 62534 $path:/home/fil/1.txt ./${path}.txt
ret=`cat ${path}.txt`
rm ${path}.txt
echo ${path}:$ret

}

i=$(func1 "10.10.11.33")
echo $i

i=$(func1 "10.10.11.34")
echo $i
i=$(func1 "10.10.11.35")
echo $i
i=$(func1 "10.10.11.36")
echo $i
i=$(func1 "10.10.11.37")
echo $i
i=$(func1 "10.10.11.38")
echo $i
i=$(func1 "10.10.11.39")
echo $i
i=$(func1 "10.10.11.40")
echo $i

