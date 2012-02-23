# # data = readlines.join.split("---").map {|e| e.strip}.reject {|f| f == ""}.map do |e|
# #   e.split("\n").map {|f| f.strip}.reject {|f| f == ""}.map do |f|
# #     f.split(":").last.strip.to_i
# #   end
# # end
# #
# # data.each.with_index do |d, i|
# #   File.open("target/plot/#{i}.dat", "w") do |f|
# #     d.each_with_index do |e, j|
# #       f.puts "#{j} #{e}"
# #     end
# #   end
# # end
# #
# # File.open("target/plot/plot.g", "w") do |f|
# #   out = ""
# #   out << %Q{set terminal pdf} << "\n"
# #   out << %Q{set output "target/plot/plot.pdf"} << "\n"
# #   out << "plot "
# #   out << data.map.with_index do |d,i|
# #     %Q{"target/plot/#{i}.dat" using 1:2 title "Take #{i}" with lines}
# #   end.join(",")
# #   f.puts out
# # end
# 
# def grp(lines)
#   ar = []
# 
#   ar
# end
# 
# data = {}
# last = nil
# 
# readlines.each do |line|
#   # puts line
#   case line
#   when %r{== Instance \d+ \| optimal: \d+ \| alg: G\(k=(\d+), n=(\d+)\) ==}
#     last = "GA_#{$1}-#{$2}"
#     data[last] ||= []
#   when %r{== Instance \d+ \| optimal: \d+ \| alg: TS\(n=(\d+), k=(\d+), t=(\d+)\) ==}
#     last = "TS_#{$1}-#{$2}-#{$3}"
#     data[last] ||= []
#   when %r{== Instance \d+ \| optimal: \d+ \| alg: SA\((.+?)\) ==}
#     last = "SA_#{$1}"
#     data[last] ||= []
#   when /\*\)/
#     data[last] << line
#   end
# end
# 
# data = data.map {|k,v|
#   [k] +  v.map {|e|
#     e.split("[")[2].split("]").first.strip.sub("%", "").sub(",", ".").to_f
#   }
# }
# 
# 
# data.transpose.each do |a|
#   puts a.join("\t")
#   # puts a[1]
# end
# 
# 
# # data.each do |k,v|
# #   puts k
# #   puts v
# #   puts
# #   puts
# #   puts
# # end

readlines.each do |line|
  parts = line.split("|")
  
  alg = parts[0].split(":")[1].strip
  time = parts[1].split(":")[1].strip.gsub(",", ".")
  
  puts "#{alg}\t#{time}"
end
