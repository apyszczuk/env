#!/bin/bash

function get_system_update_icon () {
    echo ""
}

get_system_update_icon

while read button
do
	if [ "$button" -eq "$BUTTON" ]; then
        system_update
	fi
	get_system_update_icon
done
