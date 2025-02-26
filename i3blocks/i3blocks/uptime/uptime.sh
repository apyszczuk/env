#!/bin/bash

output=$(awk '{
    days = int($1/(24*3600));
    hours_total = int($1/3600);
    minutes = int(($1%3600)/60);
    hours_of_day = hours_total-24*days;

    printf "%s,%s:%s", days,
                       hours_of_day < 10 ? "0"hours_of_day : hours_of_day,
                       minutes < 10 ? "0"minutes : minutes
}' /proc/uptime)

[ ${#output} -le 2 ] && echo "$output"min && exit 0

echo "$output"

exit 0
