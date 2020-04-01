#! /bin/sh

state="$(acpi | cut -d ' ' -f 3 | sed 's/,//')"				#current state [Chargin | Discharging]
current="$(acpi | cut -d ' ' -f 4 | sed 's/%,//')"			#current battery level [0 | 1 | 2 | and so on]
dis=Discharging												#comparison value for $state
raff=20														#value for the 1° notification level
raffIntense=12												#value for the 2° notification level
raffExtreme=7												#value for the 3° notification level
max='100%'													#maximum battery value

function notify () {										#1° level, low intensity
	eject
	paplay --volume=65536 ~/Music/beep.wav &
	sleep 25
}


function notifyIntense () {									#2° level, medium intensity
	eject
	paplay --volume=65536 ~/Music/beep.wav &
	sleep 20
}


function notifyExtreme () {									#3° level, extreme intensity
	feh -xF ~/Pictures/warning.png &
	eject
	paplay --volume=65536 ~/Music/explosion.wav &
	sleep 10
}


current="$(echo $current | sed 's/%//')"

if [ $current = $max ]																								#ok, fuck off, comment code is boring asd
then
	echo ' '
else

	if [ $state = $dis ]																							#condition on $state
	then
		if [ $current -lt $raff ] || [ $current -eq $raff ]
		then
			#echo '          [ALLERT: critical battery level]' $count
		
			if [ $current -lt $raff ] && [ $current -gt $raffIntense ] || [ $current -eq $raff ]					#condition on $current, level moderate
			then
				notify
			fi

			if [ $current -lt $raffIntense ] || [ $current -eq $raffIntense ] && [ $current -gt $raffExtreme ]		#condition on $current, level sustained
			then
				notifyIntense
			fi

			if [ $current -lt $raffExtreme ] || [ $current -eq $raffExtreme ]										#condition om $current, level OVERKILL
			then
				notifyExtreme
			fi
		else
			echo ' '
		fi
	fi
fi

