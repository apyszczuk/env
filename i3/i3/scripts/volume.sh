#!/bin/bash

AMIXER=amixer
CHANNEL=Master

function main()
{
    step="$2"
    if [ "$step" == "" ]; then
        step=1
    fi

    case "$1" in
        "increase")
            "$AMIXER" set "$CHANNEL" "$step"+ > /dev/null
            ;;
        "decrease")
            "$AMIXER" set "$CHANNEL" "$step"- > /dev/null
            ;;
        "toggle")
            "$AMIXER" set "$CHANNEL" toggle > /dev/null
            ;;
        *)
            ;;
    esac
}

main "$@"
