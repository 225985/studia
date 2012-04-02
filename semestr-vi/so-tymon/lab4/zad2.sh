#!/bin/sh

if [ $# -lt 1 ]; then               # check argv length
    echo "Usage: $0 DIR"            # print usage info
    exit 1                          # exit
fi

# W zadanym drzewie katalogow znalezc katalogi nazywajace sie tak jak dowolny plik regularny w tym katalogu

gfind $1 -printf "%f %p\n" | (
    last_p="";
    last_f=""
    while read f p; do
        if [ -d $p ]; then
            last_p="$p"
            last_f="$f"
        else
            # echo $p
            # echo $f
            echo $last_f
            echo $f
            echo
            if [ "$last_f" = "$f" ]; then
                echo $p
                if [ -f "$p" ]; then
                    echo $p;
                fi;
            fi;
        fi;

    done;)
