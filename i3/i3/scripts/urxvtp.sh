#!/bin/bash

tmp="$HOME/.terminal-cwd"

if [ -f "$tmp" ]; then
    urxvt -cd "$(cat $tmp)"
else
    urxvt
fi

unset tmp
