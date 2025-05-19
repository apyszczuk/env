#!/bin/bash

SCROT=scrot

if [ ! -v "DIR" ]; then
    DIR="$HOME"
fi

if [ ! -v "FN" ]; then
    FN="$(date +%F_%H%M%S)"
fi

if [ ! -v "EXT" ]; then
    EXT="png"
fi

if [ ! -v "FILE" ]; then
    FILE="$DIR/$FN.$EXT"
fi


function get_current_window_id()
{
    echo $(i3-msg -t get_tree | jq -r ".. | select(.focused?==true) | .window")
}

function get_selected_window_id()
{
    echo $(xwininfo | grep "Window id:" | awk '{print $4}')
}

function get_monitor_number()
{
    echo $(xrandr --listmonitors | grep "$1" | awk '{ print $1 }' | sed 's/://g')
}

function main()
{
    if [ -n "$DEBUG" ]; then
        echo "DIR   = $DIR"
        echo "FN    = $FN"
        echo "EXT   = $EXT"
        echo "FILE  = $FILE"
    fi

    case "$1" in
        "monitor")
            "$SCROT" -F "$FILE" -M "$(get_monitor_number $2)"
            ;;
        "current-window")
            "$SCROT" -F "$FILE" -w "$(get_current_window_id)"
            ;;
        "select-window")
            "$SCROT" -F "$FILE" -w "$(get_selected_window_id)"
            ;;
        "select-region")
            "$SCROT" -F "$FILE" -s -f
            ;;
        *)
            "$SCROT" -F "$FILE"
            ;;
    esac
}

main "$@"
