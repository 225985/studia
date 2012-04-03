#!/usr/bin/env ruby
# W zadanym pliku tesktowych zamienic tabulatory na spacje tak bey zachodac wygladac


if ARGV.size < 2
  puts "Usage: $0 FILE N"
  exit 1
end

path = ARGV[0]
n = ARGV[1].to_i

data = File.readlines(path).map do |line|
  line.split(//).map.with_index do |e, i|
    if e == "\t"
      "." * (n - i%n)
    else
      e
    end
  end.join
end.join

puts data


# File.open(path, "w") do |f|
#   f.write data
# end
