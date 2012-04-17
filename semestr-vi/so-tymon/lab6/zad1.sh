#!/bin/sh

if [ $# -lt 1 ]; then               # check argv length
    echo "Usage: $0 DIR"            # print usage info
    exit 1                          # exit
fi

# W zadanym drzewie katalogow znalezc pliki regularne ktore
# w swojej nazwie zawieraja ktorys z lancuchow bedacych
# nazwami katalogow nadrzednych


dir=$1
gfind "$1" -type f -printf "%h/ %f\n" | awk '{
    d = gensub(dir, "", 1, $1)

    if(d ~ "/" $2 "/"){
        an = "yes"
    } else {
        an = "no"
    }

    print $1, $2, " => ", an;
}' "dir=$dir"
