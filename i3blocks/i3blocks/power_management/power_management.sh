#!/bin/bash

function get_power_management_icon () {
    echo ""
}

get_power_management_icon

while read button
do
	if [ "$button" -eq "$BUTTON" ]; then
        power_management
	fi
	get_power_management_icon
done
