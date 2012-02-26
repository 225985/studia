#!/usr/bin/env ruby

data = File.readlines("test.mtx").grep(/^[^%]/)
@n,@m,@c = data.shift.split.map(&:to_i)

@vals = []
@cols = []
@rows = [0]

def gimmeh(data, vi, py, ri)
  return if data.empty?
  x,y,v = data.shift.split.map(&:to_i) # get line
  
  x -= 1
  y -= 1
  
  @vals[vi] = v
  @cols[vi] = x
  
  if y != py
    ri += 1
    @rows[ri] = vi
  end
  
  gimmeh(data, vi+1, y, ri)
end


gimmeh(data, 0, 0, 0)
@rows << @c

_vals = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
_cols = [0, 3, 5, 0, 1, 1, 2, 5, 0,  3,  4,  5,  1,  4,  5]
_rows = [0, 3, 5, 8, 12, 14, 15]

p _vals
p @vals
puts
p _cols
p @cols
puts
p _rows
p @rows


puts
puts
puts


@vals2 = []
@cols2 = []
@rows2 = []

def crs2ccs
  @rows2 << 0
  @n.times do |i|
    (@rows.size-1).times do |j|
      (@rows[j]...@rows[j+1]).each do |k|
        if @cols[k] == i
          @vals2 << @vals[k]
          @cols2 << j
        end
      end
    end
    @rows2 << @vals2.size
  end
end


crs2ccs

#   [1, 0, 0, 2, 0, 3],
#   [4, 5, 0, 0, 0, 0],
#   [0, 6, 7, 0, 0, 8],
#   [9, 0, 0, 10, 11, 12],
#   [0, 13, 0, 0, 14, 0],
#   [0, 0, 0, 0, 0, 15]

_vals2 = [1, 4, 9, 5, 6, 13, 7, 2, 10, 11, 14, 3, 8, 12, 15]
_cols2 = [0, 1, 3, 1, 2,  4, 2, 0,  3,  3,  4, 0, 2,  3,  5]
_rows2 = [0, 3, 6, 7, 9, 11, 15]

p _vals2
p @vals2
puts
p _cols2
p @cols2
puts
p _rows2
p @rows2

