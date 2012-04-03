#!/bin/bash

if [ ! $# -eq 1 ]
then             
    echo "zla liczba argumentow"           
    exit 1                          
fi

if [ ! -d $1 ]
then
   echo "to nie jest katalog"
   exit 1
fi

find $1 -type f -printf "%f %p\n" | sort | while read file path
do
        if [ "$first" = "$file" ] #sprawdzam czy pliki maja takei same nazwy
	then
            if [ "$checkfirst" != "$file" ] #sprawdzenie czy jest to pierwsze wystapienie by wyswietlic naglowek
	    then
                echo "plik : $file"
                echo "$pfirst"
                checkfirst=$file
            fi;
            echo "$path"
        fi;
	#nadpisanie danych
	first=$file; 
	pfirst=$path;
done
