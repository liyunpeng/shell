#! /bin/bash

# 取命令的执行结果有三种方式， dollar符号的有两种， 可以带双引号，也可以不带双引号。 第三种是反引号方式

a="$(uname -s)"
echo $a

c=$(uname -s)
echo $c

b=`uname -s`
echo $b

# read 从终端读取键盘敲入的字符串， 并把这个这个字符串赋给指定变量n
read -p "pls input a number:" n
case "$n" in
    1)
        echo "变量是1"
        ;;
    2)
        echo "变量是2"
        ;;
    3)
        echo "变量是3"
        ;;
    *)
        echo "pls input a number between 1 and 3"
        exit;
esac

# 判断敲入的数字在区间，就要用if then, 如分数等级：
read -p "pls input score to test level:" score
if [ $score -ge 90 ]; then
    echo "优秀"
elif [ $score -ge 80 ]; then
    echo "良好"
elif [ $score -ge 70 ]; then
    echo "中等"
elif [ $score -ge 60 ]; then
    echo "及格"
else
    echo "不及格"
fi


# 给字符串设置颜色
RED_COLOR='\e[1;31m'
GREEN_COLOR='\e[1;32m'
YELLOW_COLOR='\e[1;33m'
BLUE_COLOR='\e[1;34m'
RESET_COLOR='\e[0m'

echo '
    1, 悟空
    2, 八戒
    3, 唐僧
    4, 白龙马
'
read -p "pls input a number:" n

case $n in
    1)
        echo -e  "${RED_COLOR}悟空${RESET_COLOR}"   # 悟空显示为红色
        ;;
    2)
        echo -e  "${GREEN_COLOR}八戒${RESET_COLOR}"
        ;;
    3)
        echo -e  "${YELLOW_COLOR}唐僧${RESET_COLOR}"
        ;;
    4)
        echo -e  "${BLUE_COLOR}白龙马${RESET_COLOR}"
        ;;
    *)
        echo "you need input a number in {1|2|3|4}"
esac
