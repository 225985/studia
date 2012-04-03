#!/bin/sh

#Dla zadanego pliku tekstowego wylistować treść w postaci :
#1. Pierwsze zdanie
#2. Drugie zdanie
#...

if [ ! $# -eq 1 ]
then
	echo "Zla liczba argumentow"
	exit 1
fi


awk 'BEGIN {RS= "[.?!]"} /[alphanum]/ { 
gsub("\n", " "); gsub(/^ +/, ""); 
print NR ".",$0 RT}' "$1"

