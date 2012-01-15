# data = readlines.join.split("---").map {|e| e.strip}.reject {|f| f == ""}.map do |e|
#   e.split("\n").map {|f| f.strip}.reject {|f| f == ""}.map do |f|
#     f.split(":").last.strip.to_i
#   end
# end
#
# data.each.with_index do |d, i|
#   File.open("target/plot/#{i}.dat", "w") do |f|
#     d.each_with_index do |e, j|
#       f.puts "#{j} #{e}"
#     end
#   end
# end
#
# File.open("target/plot/plot.g", "w") do |f|
#   out = ""
#   out << %Q{set terminal pdf} << "\n"
#   out << %Q{set output "target/plot/plot.pdf"} << "\n"
#   out << "plot "
#   out << data.map.with_index do |d,i|
#     %Q{"target/plot/#{i}.dat" using 1:2 title "Take #{i}" with lines}
#   end.join(",")
#   f.puts out
# end

def grp(lines)
  ar = []

  ar
end

data = {}
last = nil

readlines.each do |line|
  if line.match %r{== Instance \d+ \| optimal: \d+ \| alg: G\(k=(\d+), n=(\d+)\) ==}
    last = "#{$1}-#{$2}"
    data[last] ||= []
  elsif line =~ /\*\)/
    data[last] << line
  end
end

data = Hash[data.map {|k,v|
  [k, v.map {|e|
    e.split("[")[2].split("]").first.strip.sub("%", "").sub(",", ".").to_f
  }]
}]

data.each do |k,v|
  puts k
  puts v
  puts
  puts
  puts
end
