#!/usr/bin/env ruby
# W zadanym katalogu znalesc dowiazania symboliczne do plikow regularnych
# do ktorychw ykonawca skryptu ma prawo zapisu i przerobic
# aby dowiazanie bylo zdefiniowane sciezka ./nazwa_pliku

if ARGV.size < 1
  puts "Usage: $0 FILE"
  exit 1
end

require "fileutils"

dir = File.realpath(ARGV.first)

Dir["#{dir}/*"].each do |path|
  if File.symlink?(path)
    real = File.realpath(path)

    if File.executable?(real) && File.file?(real) && File.dirname(real) == dir
      FileUtils.rm(path)
      FileUtils.ln_s("./#{File.basename(real)}", path)
    end
  end
end


#  lab7 λ ls -la /tmp/so                                                                                                                                                          15:20:09
# total 32
# drwxr-xr-x  10 teamon  wheel   340B  2 kwi 15:19 ./
# drwxrwxrwt  17 root    wheel   578B  2 kwi 15:20 ../
# -rw-r--r--   1 teamon  wheel     0B  2 kwi 15:00 a
# -rwxr-xr-x   1 teamon  wheel     0B  2 kwi 15:00 b*
# -rwxr-xr-x   1 teamon  wheel     0B  2 kwi 15:00 c*
# drwxr-xr-x   2 teamon  wheel    68B  2 kwi 15:01 d/
# lrwxr-xr-x   1 teamon  wheel     3B  2 kwi 15:16 sa@ -> ./a
# lrwxr-xr-x   1 teamon  wheel     9B  2 kwi 15:18 sb@ -> /tmp/so/b
# lrwxr-xr-x   1 teamon  wheel     1B  2 kwi 15:17 sc@ -> c
# lrwxr-xr-x   1 teamon  wheel     1B  2 kwi 15:19 sd@ -> d
#
#  lab7 λ ./zad1.rb /tmp/so
#                                                                                                                                         15:20:31
#  lab7 λ ls -la /tmp/so                                                                                                                                                          15:20:35
# total 32
# drwxr-xr-x  10 teamon  wheel   340B  2 kwi 15:20 ./
# drwxrwxrwt  17 root    wheel   578B  2 kwi 15:20 ../
# -rw-r--r--   1 teamon  wheel     0B  2 kwi 15:00 a
# -rwxr-xr-x   1 teamon  wheel     0B  2 kwi 15:00 b*
# -rwxr-xr-x   1 teamon  wheel     0B  2 kwi 15:00 c*
# drwxr-xr-x   2 teamon  wheel    68B  2 kwi 15:01 d/
# lrwxr-xr-x   1 teamon  wheel     3B  2 kwi 15:16 sa@ -> ./a
# lrwxr-xr-x   1 teamon  wheel     3B  2 kwi 15:20 sb@ -> ./b
# lrwxr-xr-x   1 teamon  wheel     3B  2 kwi 15:20 sc@ -> ./c
# lrwxr-xr-x   1 teamon  wheel     1B  2 kwi 15:19 sd@ -> d

