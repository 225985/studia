#!/bin/sh

# Tymon Tobolski 181037
# Zad 9 (http://www.zsk.ict.pwr.wroc.pl/zsk/repository/dydaktyka/so/so_lab1.pdf)
# Kasowanie wszystkich plików pustych (o zerowej wielkości) w zadanym katalogu (parametr wywołania skryptu).
# Skrypt powinien tworzyć w zadanym pliku listę skasowanych plików.
# Nie powinien analizować dołączeń symbolicznych.

if [ $# -lt 2 ]; then                       # check argv length
    echo "Usage: $0 DIR LOGFILE"            # print usage info
    exit 1                                  # exit
fi

for i in `ls $1`; do                        # list files in directory
    if [ -f "$1/$i" -a ! -s "$1/$i" ]; then # if file is regular file and has zero length
        echo "Removing $1/$i"               # print information of removed file
        echo "$1/$i" >> $2                  # save removed file path to specified file
        rm "$1/$i"                          # remove file
    fi
done


# Przykładowe wykonanie skryptu
#
#  /tmp/test λ ls -la                                                                                                                                                             15:02:14
# total 24
# drwxr-xr-x   7 teamon  wheel  238 Feb 20 15:02 ./
# drwxrwxrwt  14 root    wheel  476 Feb 20 14:58 ../
# -rw-r--r--   1 teamon  wheel    2 Feb 20 14:27 a.txt
# -rw-r--r--   1 teamon  wheel    2 Feb 20 14:27 b.txt
# -rw-r--r--   1 teamon  wheel    0 Feb 20 15:02 c.txt
# -rw-r--r--   1 teamon  wheel    0 Feb 20 15:02 d.txt
# lrwxr-xr-x   1 teamon  wheel    5 Feb 20 14:33 x.txt@ -> c.txt

#  ~/Desktop/so λ ./zad9.sh /tmp/test REMOVED                                                                                                                                         14:47:00
# Removing /tmp/test/c.txt
# Removing /tmp/test/d.txt

#  /tmp/test λ ls -la                                                                                                                                                             15:02:15
# total 24
# drwxr-xr-x   5 teamon  wheel  170 Feb 20 15:02 ./
# drwxrwxrwt  14 root    wheel  476 Feb 20 14:58 ../
# -rw-r--r--   1 teamon  wheel    2 Feb 20 14:27 a.txt
# -rw-r--r--   1 teamon  wheel    2 Feb 20 14:27 b.txt
# lrwxr-xr-x   1 teamon  wheel    5 Feb 20 14:33 x.txt@ -> c.txt

#  ~/Desktop/so λ cat REMOVED                                                                                                                                                          15:02:30
# /tmp/test/c.txt
# /tmp/test/d.txt


