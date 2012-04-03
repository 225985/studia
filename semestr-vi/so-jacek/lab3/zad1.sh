#!/bin/bash

#W zadanym drzewie katalogów znaleźć podkatalogi zawierające minimum n podkatalogów oraz mające ustawione 
#atrybuty dostępu tak, że właściciel nie ma prawa odczytu lub wykonania, natomiast grupa lub inni mają prawo 
#odczytu

if [ ! $# -eq 2 ]
then
	echo "zla liczba argumentow"
	exit 1
fi

if [ ! -d $1 ]
then
	echo "katalog nie istnieje"
	exit 1
fi


find $1 -type d -links +$(($2+2)) \( \( ! -perm -u+r  \) -or \( ! -perm -u+x \) \) -and \( -perm -g+r -or -perm -o+r \) -print

