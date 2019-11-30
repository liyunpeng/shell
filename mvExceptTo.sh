#! /bin/bash
#功能说明： 把当前除指定目录的所有文件都移到指定目录下

#参数说明： 参数1是当前目录下所有文件要拷贝到的目录名

fileName=$1

ls | grep -vw ${fileName} | xargs -i mv {} ${fileName}/

#ls | grep -vw cc | xargs -i mv {} cc/