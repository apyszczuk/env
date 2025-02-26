#!/bin/bash

all_packages=$(pacman -Q | wc -l)
explicitly_installed=$(pacman -Qe | wc -l)
available_upgrade_packages=$(echo "n" | sudo pacman -Syu 2> /dev/null | grep "Package" | awk '{print $2}' | sed 's/(//' | sed 's/)//')

echo -n "$all_packages/$explicitly_installed"

if [ "$available_upgrade_packages" != "" ]; then
    echo -n "/"
    if [ "$available_upgrade_packages" -lt "10" ]; then
        echo -n "0"
    fi
    echo "$available_upgrade_packages"
    exit 33
else
    echo "/00"
    exit 0
fi
