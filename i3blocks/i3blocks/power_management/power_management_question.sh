#!/bin/bash

echo "--- POWER MANAGEMENT ---"
echo ""
echo "(s)hutdown"
echo "(r)eboot"
echo "(l)ock session"

read -n 1 ans

if [ "$ans" == "s" ]; then
    systemctl poweroff
elif [ "$ans" == "r" ]; then
    systemctl reboot
elif [ "$ans" == "l" ]; then
    sh ~/.config/i3/lock_session.sh
fi
