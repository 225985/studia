#!/usr/bin/env ruby

puts ["n", "m", "%"].join("\t")

Dir[File.join(File.dirname(__FILE__), "..", "results/*/stats.tsv")].map do |f|
  lines = File.readlines(f).map do |line|
    line.chomp.split("\t")
  end

  n = lines[1][1].to_i / 3
  ok = lines[1][2].to_i * 100 / 3 
  m = lines[1][10].to_i

  puts [n, m, ok / n].join("\t")
end
