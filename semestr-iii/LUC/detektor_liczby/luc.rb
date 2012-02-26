#!/usr/bin/env ruby

# Usage: cat data.txt | ./luc.rb -t
#        cat exp.txt | ./luc.rb -e

input = STDIN.readlines.reject {|e| e =~/^#/ }

case ARGV.first

when "-t"

  JK = [
    [["0", "*"], ["1", "*"]],
    [["*", "1"], ["*", "0"]] 
  ]

  qts = []
  zts = []
  qt1s = []

  input.each do |line|
    a = line.split.map(&:to_i)
    qts << a[0]
    zts << a[1]
    qt1s << a[2]
  end

  qts_size = qts.max.to_s(2).size
  zts_size = zts.max.to_s(2).size

  qt_header = qts_size.times.to_a.reverse.map {|e| "Q#{e}" }.join(" ")
  zt_header = zts_size.times.to_a.reverse.map {|e| "Z#{e}" }.join(" ")

  jk_header = qts_size.times.to_a.reverse.map do |i|
    "J#{i} K#{i}"
  end.join(" | ")

  header = "Q Z | Q' ||  #{qt_header} | #{zt_header} || #{qt_header} || #{jk_header}"
  puts header
  puts "-" * header.size

  qts.each_with_index do |qt, i|
    qt_s = qt.to_s(2).rjust(qts_size, "0").split(//)
    zt_s = zts[i].to_s(2).rjust(zts_size, "0").split(//)
    qt1_s = qt1s[i].to_s(2).rjust(qts_size, "0").split(//)
  
    q_h = qt_s.map{|e| e.rjust(2) }.join(" ")
    z_h = zt_s.map{|e| e.rjust(2) }.join(" ")
    q1_h = qt1_s.map{|e| e.rjust(2) }.join(" ")
  
    qt_i = qt_s.map(&:to_i)
    qt1_i = qt1_s.map(&:to_i)
  
    jk = qt_i.map.with_index do |q, i|
      JK[q][qt1_i[i]].map {|e| e.rjust(2)}.join(" ")
    end.join(" | ")

    puts "%d %d | %d  ||  %s | %s || %s || %s" % [qt, zts[i], qt1s[i], q_h, z_h, q1_h, jk]
  end

when "-e"
  puts "\\\\" + input.join.gsub(/~([A-Z0-9]+)/, "\\overline{\\1}").gsub(/\n/, " \\\\\\\n")
end