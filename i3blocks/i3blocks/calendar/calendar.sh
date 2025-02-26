#!/bin/bash

function get_calendar () {
    echo ""
}

get_calendar

while read button
do
	if [ "$button" -eq "$BUTTON" ]; then
        termite --class="termite_calendar" -c "calendar/termite_calendar_config" -e "./calendar/calendar_command.sh"
	fi
	get_calendar
done
