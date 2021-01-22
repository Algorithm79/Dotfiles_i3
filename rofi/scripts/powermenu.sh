#!/bin/bash

if [[ -n $@ ]]; then
	case $1 in
		'Logout')
			i3-msg exit;;
		'Suspend')
			systemctl suspend;;
		'Reboot')
			systemctl reboot;;
                'Lock')
                        betterlockscreen -l dim;;
		'Shutdown')
			systemctl poweroff;;
	esac
else
	echo -en "Logout\x00icon\x1fsystem-log-out\n"
	echo -en "Suspend\x00icon\x1fsystem-suspend\n"
	echo -en "Reboot\x00icon\x1fsystem-reboot\n"
        echo -en "Lock\x00icon\x1fsystem-lock-screen\n"
	echo -en "Shutdown\x00icon\x1fsystem-shutdown\n"
fi
