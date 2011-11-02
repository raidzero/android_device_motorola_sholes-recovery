#!/system/bin/sh
#enable charging
#original script by trevorj ~ droidmod

setprop dev.recovery.battd 0

while [[ "`getprop dev.recovery.battd`" == "0" ]]; do
	if [[ `cat /sys/class/power_supply/battery/status|grep Unknown` ]]; then
		 (stop battd; sleep 2; start battd)
	else
		setprop dev.recovery.battd 1
		
	fi
	sleep 7
done
