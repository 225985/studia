#!/bin/sh

# vim: ft=sh sw=2 ts=2 sts=2 tw=80 et fenc=utf8
#------------------------------------------------------------------------------#
# Dla zadanego drzewa katalogów zmienić nazwy plików z camel case na underscore.
#
# * nie zmieniać ścieżek
# * nie zmieniać pierwszej litery
# * nie zmieniać ostatniego rozszerzenia
#

if [ $# -ne 1 ]
then
  echo "zla liczba argumentow"
  exit 1
fi

if [ ! -d $1 ]
then
	echo "to nie katalog"
  exit 1
fi



gfind "$1" -type f -printf "%h %f\n" | gawk '
{
  first = gensub(/^(\w).*$/, "\\1", "g", $2);
  basename = gensub(/^(.+?)\.[^.]+$/, "\\1", "g", $2);
  ext = gensub(/.*\.([^.]+)$/, "\\1", "g", $2);

  orig = basename;
  basename = gensub(/./, "", "", basename);
  basename = gensub(/[A-Z]/, "_\\0", "g", basename);
  basename = tolower(basename);
  if (orig != ext) {
    print $1 "/" $2, $1 "/" first basename "." ext;
  } else {
    print $1 "/" $2, $1 "/" first basename;
  }
}
' | (while read src dst; do
 mv "$src" "$dst"
done)