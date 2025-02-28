#!/bin/bash

output=$(cat /proc/loadavg | awk '{ printf "%s %s %s\n", $1, $2, $3}')

echo " $output"

exit 0
