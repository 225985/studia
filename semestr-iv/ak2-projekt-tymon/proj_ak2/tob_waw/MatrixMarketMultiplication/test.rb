#!/usr/bin/env ruby

require "matrix"

if ARGV.size < 3
  puts "Usage: #{__FILE__} [matrix1.mtx] [matrix2.mtx] [result.mtx]"
  exit
end

def load(file)
  puts "Reading #{file}"
  data = File.readlines(file).grep(/^[^%]/)
  m,n,c = data.shift.split.map(&:to_i)
  values = Array.new(n) { Array.new(m, 0) }

  data.each do |line|
    x,y,v = line.split
    values[x.to_i-1][y.to_i-1] = v.to_f
  end

  Matrix[*values]
end

a,b,res = [0,1,2].map{|i| load(ARGV[i]) }

c = a*b

# puts a.hash
# puts b.hash
# puts c.hash
# puts res.hash

ce = c.each
an = res.all? do |r|
  # put values in the same format
  x = "%10.3g" % [ce.next]
  y = "%10.3g" % [r]
  
  x == y
end

if an
  puts "Correct :)"
  exit(0)
else
  puts "Matrices do not match"
  exit(1)
end
