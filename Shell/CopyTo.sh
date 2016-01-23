####UTF-8,UNIX(LF)
#!/bin/sh
#clear
#echo "find a file ...."

roo_path=${ANDROID_BUILD_TOP}
root_out=${ANDROID_PRODUCT_OUT}${jupiter_Model}
root_system_lib=${root_out}/system/lib
root_system_bin=${root_out}/system/bin

current_code=`pwd`
current_path=${root_code}

if [ $# -ne 1 ]; then
	echo -e "\033[31m""Parameter number error, num="$#"\033[0m"
	echo "END..."
	return 1
fi

if [ ! -d $1 ]; then
	echo $1 : not a entry
	echo "END..."
	return 1
fi

LibFile=( "libNPuComHandler.so"
          "libNPSysCtrlHandler.so"
          "libNPKeyHandler.so"
          "libtouchcalib_if.so"
          "libdebugmodeproxy_jni.so"
          "libsysdIF.so"
          "libPFileService.so"
          "libEmuSyscon.so"
          "libPSystemService.so"
          "libNPHandlerBase.so"
          "libNPCanBusHandler.so"
          "libNPEtcHandler.so"
          "libNPDsrcHandler.so"
          "libNPEtcDsrcDivHandler.so"
          "libNPHdArtHandler.so"
          "libNPiDatalinkHandler.so"
          "libNPPnpHandler.so"
          "libNPRdsTmcHandler.so"
          "libPCommonLib.so"
          "libPSocketLib.so"
          "libEmuSender.so"
          "libsysconDab.so"
          "libsysconSetting.so"
          "libSysconTag.so"
          "libsysconTuner.so"
          "libsysconHDRadio.so"
          "libsyscondivx.so"
          "libsysconDvd.so"
          "libechocancel.so"
          "libNPPortLib.so"
          "libOomAdj.so"
          "libNPVicsFMHandler.so"
          "libNPVicsFMData.so"
        )

BinFile=( "sysd"
          "ctst_sysdIFLib"
          "test_sysdIF"
          "IamSyscon"
          "emusyscon"
          "PFileSDOperator"
          "PFileUSB1Operator"
          "PFileUSB2Operator"
        )
        




echo "ooxx" | sudo -S  echo "Start..."

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



sync
echo "END..."
echo



