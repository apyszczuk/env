#!/bin/bash

STEP_VALUE="$1"

if [ "$STEP_VALUE" == "" ]; then
    STEP_VALUE=1
fi

amixer set Master "$STEP_VALUE"- > /dev/null
