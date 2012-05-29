#!/usr/bin/env ruby
# Skopiować zadany katalog $1 do nowo utworzonego miejsca $2
# (jeżeli $2 już istnieje, to komunikat błędu).
# W kopii wszystkie pliki regularne muszą mieć swoje kopie,
# katalogi muszą mieć puste odpowiedniki o tej samej nazwie,
# kopie dowiązań symbolicznych wskazujących poza katalog muszą
# wskazywać na ten sam obiekt, co pierwowzór,
# kopie dowiązań wskazujących na obiekty w katalogu pierwotnym
# powinny wskazywać na ich kopie w drugim katalogu.

require "fileutils"

if ARGV.size < 2
  puts "Usage: $0 DIRA DIRB"
  exit 1
end

src = File.realpath(ARGV[0])
dst = ARGV[1]

if File.exist?(dst)
  puts "#{dst} already exists"
  exit -1
end

FileUtils.mkdir_p(dst)

Dir["#{src}/*"].each do |path|
  name = File.basename(path)
  new_path = File.join(dst, name)

  if File.symlink?(path)
    real = File.realpath(path)
    if real =~ /^#{src}/
      npath = real.gsub(File.join(src, "/"), "")
      FileUtils.ln_s npath, new_path
    else
      FileUtils.ln_s real, new_path
    end
  elsif File.directory?(path)
    FileUtils.mkdir new_path
  else
    FileUtils.cp path, new_path
  end
end


# test

#  lab9 λ ls -la /tmp/so
# total 32
# drwxr-xr-x  10 teamon  wheel   340B 30 kwi 14:06 ./
# drwxrwxrwt  14 root    wheel   476B 30 kwi 14:16 ../
# -rw-r--r--   1 teamon  wheel     0B 30 kwi 14:02 a
# -rw-r--r--   1 teamon  wheel     0B 30 kwi 14:02 b
# drwxr-xr-x   3 teamon  wheel   102B 30 kwi 14:05 c/
# drwxr-xr-x   2 teamon  wheel    68B 30 kwi 14:02 d/
# lrwxr-xr-x   1 teamon  wheel     5B 30 kwi 14:06 rel@ -> ../sp
# lrwxr-xr-x   1 teamon  wheel     1B 30 kwi 14:02 sa@ -> a
# lrwxr-xr-x   1 teamon  wheel     1B 30 kwi 14:03 sc@ -> c
# lrwxr-xr-x   1 teamon  wheel     4B 30 kwi 14:05 sext@ -> /tmp
#
#  lab9 λ ./zad2.rb /tmp/so ~/Desktop/so-copy
# /Users/teamon/Desktop/so-copy already exists
#
#  lab9 λ rm -rf ~/Desktop/so-copy
#
#  lab9 λ ./zad2.rb /tmp/so ~/Desktop/so-copy
#
#  lab9 λ ls -la ~/Desktop/so-copy
# total 32
# drwxr-xr-x  10 teamon  staff   340B 30 kwi 14:17 ./
# drwx------+ 23 teamon  staff   782B 30 kwi 14:17 ../
# -rw-r--r--   1 teamon  staff     0B 30 kwi 14:17 a
# -rw-r--r--   1 teamon  staff     0B 30 kwi 14:17 b
# drwxr-xr-x   2 teamon  staff    68B 30 kwi 14:17 c/
# drwxr-xr-x   2 teamon  staff    68B 30 kwi 14:17 d/
# lrwxr-xr-x   1 teamon  staff    15B 30 kwi 14:17 rel@ -> /private/tmp/sp
# lrwxr-xr-x   1 teamon  staff     1B 30 kwi 14:17 sa@ -> a
# lrwxr-xr-x   1 teamon  staff     1B 30 kwi 14:17 sc@ -> c
# lrwxr-xr-x   1 teamon  staff    12B 30 kwi 14:17 sext@ -> /private/tmp
