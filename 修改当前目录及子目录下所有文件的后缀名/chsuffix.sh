#! /bin/bash
# 参数1是源文件后缀名， 参数2是目标文件后缀名
# 示例：讲所有后缀名.txt转换为.xml
# ./chsuffix.sh txt xml
srcNam=$1
destName=$2

for name in `find -name *.${srcNam}`
do
	# echo $name
	# echo ${name%${destName}}
	mv $name ${name%.${srcNam}}.${destName}
done

echo "find -name *.${destName}:"
find -name *.${destName}

