#!/bin/sh

if [ $# -lt 1 ]; then               # check argv length
    echo "Usage: $0 FILE N"         # print usage info
    exit 1                          # exit
fi


# Zadany plik tekttowy \t => n spacji

gawk -v n=$2 'BEGIN { RS="\t"  } { print $1  }' $1
