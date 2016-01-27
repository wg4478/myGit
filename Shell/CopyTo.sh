####UTF-8,UNIX(LF)
#!/bin/sh
#clear
#echo "find a file ...."

roo_path=${ANDROID_BUILD_TOP}
root_out=${ANDROID_PRODUCT_OUT}${jupiter_Model}
#root_out=${ANDROID_PRODUCT_OUT}
root_system_lib=${root_out}/system/lib
root_system_bin=${root_out}/system/bin
root_system_app=${root_out}/system/app

current_code=`pwd`
current_path=${root_code}

if [ $# -ne 1 ]; then
	echo -e "\033[31m""Parameter number error, num="$#"\033[0m"
	echo "END..."
	exit
fi

if [ ! -d $1 ]; then
	echo $1 : not a entry
	echo "END..."
	exit
fi

LibFile=( "libTestMode.so"
          "libTestModeProxy.so"
          "libucomTestMode.so"
        )

BinFile=( "TestModeService"
          "TestModeR"
        )

AppFile=( "TestMode.apk"
        )

echo "\ " | sudo -S  echo "Start..."

for name in ${LibFile[@]}
do
  sudo cp ${root_system_lib}/${name}  $1/lib/
  ls -l $1/lib/${name}
done

for name in ${BinFile[@]}
do
  sudo cp ${root_system_bin}/${name}  $1/bin/
  ls -l $1/bin/${name}
done

for name in ${AppFile[@]}
do
  sudo cp ${root_system_app}/${name}  $1/app/
  ls -l $1/app/${name}
done

sync
echo "END..."
echo
