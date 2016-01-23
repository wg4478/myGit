#遍历当前目录下的文件，并删除交换文件
find ./ -type f -name "*.swp"|xargs rm -rf
find ./ -type f -name "*~"|xargs rm -rf
