# usage:
# ruby blad.rb [-c] PROCENT DGT RDG
# cat data.txt | ruby blad.rb [-c] PROCENT DGT
# -c  - use comma as decimal separator

def calc(percent, ndgt, dgt, rdg)
  if @comma
    percent, dgt, rdg = [percent, dgt, rdg].map {|e| e.gsub(",", ".") }
  end
  res = rdg.to_f * (percent.to_f / 100) + (ndgt.to_i * dgt.to_f)
  res = res.to_s.gsub(".", ",") if @comma
  res
end

if ARGV.first == '-c'
  @comma = true
  ARGV.shift
end

if ARGV.size == 3
  @percent = ARGV[0]
  @ndgt = ARGV[1]
  @dgt = ARGV[2]
  puts STDIN.readlines.reject{|e| e =~ /^\s$/ }.map {|e| calc(@percent, @ndgt, @dgt, e.gsub("\n", ""))}
elsif ARGV.size == 4
  puts calc(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
else
  puts "usage:"
  puts "ruby blad.rb [-c] PROCENT nDGT DGT RDG"
  puts "cat data.txt | ruby blad.rb [-c] PROCENT nDGT DGT"
  exit
end
