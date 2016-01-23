#########################################################################
# File Name: /home/wangshuai/ctags.sh
# Author: Robbin
# mail: linux_wangshuai@163.com
# Created Time: 2015年03月30日 星期一 16时52分32秒
#########################################################################
#!/bin/bash
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
cscope -Rbq -f cscope.out

# generate tag file for lookupfile plugin
echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
find . -not -regex '.*\.\(png\|gif\)' -type f -printf "%f\t%p\t1\n" | \
	sort -f >> filenametags
