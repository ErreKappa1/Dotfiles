#! /bin/sh

state="$(acpi | cut -d ' ' -f 3 | sed 's/,//')"
current="$(acpi | cut -d ' ' -f 4 | sed 's/%,//')"
if [ $state = "Discharging" ] || [ $state = "Charging" ]
then
	if [ $state = "Discharging" ] && [ $current -lt 21 ]
	then
		echo [$current] [Allert!]
	else
		echo [$current] [$state]
	fi
else
	echo "[$state]"
fi

