#!/bin/sh

# Tymon Tobolski 181037
# zmiana nazw -f + z dostepem exec na koncu ext ".w$i"


if [ $# -lt 1 ]; then               # check argv length
    echo "Usage: $0 DIR"            # print usage info
    exit 1                          # exit
fi

n=0                                         # set n to 0
for i in `ls $1`; do                        # list files
    if [ -f "$1/$i" -a -x "$1/$i" ]; then   # if file is regular file and has x flag
        n=`expr $n + 1`                     # increment n
        echo "Renaming $1/$i to $1/$i.w$n"  # print info
        mv "$1/$i" "$1/$i.w$n"              # rename file
    fi
done

#  so λ ls -la /tmp/test                                                                                                                                                     15:11:15
# total 16
# drwxr-xr-x   6 teamon  wheel  204 Feb 20 15:05 ./
# drwxrwxrwt  15 root    wheel  510 Feb 20 15:08 ../
# -rw-r--r--   1 teamon  wheel    2 Feb 20 14:27 a.txt
# -rwxr-xr-x   1 teamon  wheel    2 Feb 20 14:27 b.txt*
# -rw-r--r--   1 teamon  wheel    0 Feb 20 15:05 c.txt
# -rwxr-xr-x   1 teamon  wheel    0 Feb 20 15:05 d.txt*
#
#  so λ ./zad1.2.sh /tmp/test                                                                                                                                                15:11:38
# Renaming /tmp/test/b.txt to /tmp/test/b.txt.w1
# Renaming /tmp/test/d.txt to /tmp/test/d.txt.w2
#
#  so λ ls -la /tmp/test                                                                                                                                                     15:11:40
# total 16
# drwxr-xr-x   6 teamon  wheel  204 Feb 20 15:11 ./
# drwxrwxrwt  15 root    wheel  510 Feb 20 15:08 ../
# -rw-r--r--   1 teamon  wheel    2 Feb 20 14:27 a.txt
# -rwxr-xr-x   1 teamon  wheel    2 Feb 20 14:27 b.txt.w1*
# -rw-r--r--   1 teamon  wheel    0 Feb 20 15:05 c.txt
# -rwxr-xr-x   1 teamon  wheel    0 Feb 20 15:05 d.txt.w2*
