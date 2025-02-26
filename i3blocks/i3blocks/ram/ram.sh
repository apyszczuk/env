#!/bin/bash

output=$(free --mega | grep Mem)

total_ram=$(echo "$output" | awk '{ print $2 }')
used_ram=$(echo "$output" | awk '{ print $3 }')
let "used_ram_percent = 100 * $used_ram / $total_ram"

long_text=" "$used_ram"MB("$used_ram_percent"%)"
echo "$long_text"

[ "$used_ram_percent" -ge "$HIGH_LEVEL" ] && exit 33

exit 0
