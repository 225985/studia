#!/bin/sh

if [ $# -lt 1 ]; then               # check argv length
    echo "Usage: $0 DIR"            # print usage info
    exit 1                          # exit
fi

# W zadanym katalogu znalezc pliki -f o takich samych nazwach i wylistowac je w postaci
# file:
#     path1
#     path2
#     path3


gfind $1 -type f -printf "%f %p\n" | sort | (
    last_f=""
    last_p=""
    op=""
    while read f p; do
        if [ "$last_f" = "$f" ]; then
            if [ "$op" != "$f" ]; then
                echo "$f"
                echo "  $last_p"
                op="$f"
            fi;
            echo "  $p"
        fi;

        last_f=$f;
        last_p=$p;
    done;)
