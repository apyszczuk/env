#!/bin/bash

function get_volume_prop () {
	output=$(amixer get Master | grep "%" | awk '{ print $6 $4 }' | sed 's/\]\[/ /' | sed 's/\[//' | sed 's/\]//' | tr a-z A-Z)
    mode=$(echo "$output" | awk '{print $1}')
    percent=$(echo "$output" | awk '{print $2}')
    if [ "$mode" == "OFF" ]; then
        volume_sign=" "
    else
        value=$(echo "$percent" | sed 's/%//')
        if [ "$value" == "0" ]; then
            volume_sign=" "
        elif [ "$value" -lt "50" ]; then
            volume_sign=" "
        else
            volume_sign=" "
        fi
    fi
    echo "${volume_sign} $percent"
}

get_volume_prop

while read button
do
	if [ "$button" -eq "$INCREASE_BUTTON" ]; then
        volume_increase "$STEP_VALUE"
	elif [ "$button" -eq "$DECREASE_BUTTON" ]; then
        volume_decrease "$STEP_VALUE"
	elif [ "$button" -eq "$MUTE_BUTTON" ]; then
        volume_toggle
	fi
	get_volume_prop
done
