#!/bin/bash

output=" $(ip a | grep "$IFNAME" | grep inet | awk '{ print $2 }' | sed 's/\/.*$//g')"
echo "$output"
exit 0
