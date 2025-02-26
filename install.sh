#!/bin/bash

function install()
{
    a_target="$1"
    a_link_name="$2"

    if [ -L "$a_link_name" ]; then
        unlink "$a_link_name"
    fi

    if [ -d "$a_link_name" ]; then
        echo "error: $a_link_name is a directory"
        exit 1
    fi

    if [ -e "$a_link_name" ]; then
        echo "error: $a_link_name is a file"
        exit 2
    fi

    ln -s "$(pwd)/$a_target" "$a_link_name"
}
