#!/bin/bash

output=$(df -H | grep "$DISK_NAME")
used_space=$(echo "$output" | awk '{ print $3 }')
total_space=$(echo "$output" | awk '{ print $2 }')
used_space_percent=$(echo "$output" | awk '{ print $5 }')
used_space_only_value=$(echo "$used_space_percent" | sed 's/.$//g')

long_text=" "$used_space"/"$total_space"("$used_space_percent")"
echo "$long_text"

[ "$used_space_only_value" -ge "$HIGH_LEVEL" ] && exit 33

exit 0
