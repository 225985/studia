#!/usr/bin/ruby -w

# W pliku tekstowym odszukać daty w postaci DD.MM.YYYY i zastąpić przez YY-M/MM-D/DD

require 'date'

if ARGV.count != 1
  puts "Zla liczba argumentow"
else
  file = ARGV[0]
  File.open(file).each_line{ |l|
    puts l.gsub(/\b(\d{2})\.(\d{2})\.(\d{4})\b/) {
        begin
          Date.new($3.to_i, $2.to_i, $1.to_i)
          "#{$3[2..3]}-#{$2.to_i}-#{$1.to_i}"
        rescue
          "#{$1}.#{$2}.#{$3}"
        end
    } 
  }
end
