#!/usr/bin/env ruby

require "matrix"

# ruby 1.8.7 compat
if RUBY_VERSION[0..2] != "1.9"
  class Matrix
    include Enumerable

    def each(&block)
      return to_enum(:each) unless block_given?
      @rows.each do |row|
        row.each(&block)
      end
      self
    end
  end
end

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

puts "Hardcore multiplication!"
c = a*b


ce = c.each
an = res.all? do |r|
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
