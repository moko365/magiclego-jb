#!/system/bin/sh

ril_libpath="$(/system/bin/getprop "rild.libpath")"

stop pppd_default
start pppd_kill
stop ril-daemon

if [ "/system/lib/librapid-ril-core.so" == "$ril_libpath" ]; then
	echo "will change to /system/lib/libublox-lisa-ril.so"
	/system/bin/setprop "rild.pppd" "true"
	/system/bin/setprop "rild.libpath" "/system/lib/libublox-lisa-ril.so"
else
	echo "will change to /system/lib/librapid-ril-core.so"
	/system/bin/setprop "rild.libpath" "/system/lib/librapid-ril-core.so"
fi

start ril-daemon
