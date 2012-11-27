#!/usr/bin/env ruby

puts [
  "n",
  "Homepage M",
  "Homepage %",
  "Projects M",
  "Projects %",
  "Search M",
  "Search %",
  "Project page M",
  "Project page %"].join("\t")


Dir[File.join(File.dirname(__FILE__), "..", "results/*/stats.tsv")].map do |f|
  lines = File.readlines(f).map do |line|
    line.chomp.split("\t")
  end


  n = lines[2][1].to_i


  res = lines[2..5].map do |e|
    m = e[10].to_i
    ok = e[2].to_i * 100.0 / n
    [m, ok]
  end

  res.unshift n
  # n = lines[1][1].to_i / 4
  # ok = lines[1][2].to_i * 100 / 4.0
  # m = lines[1][10].to_i

  puts res.join("\t")
end
