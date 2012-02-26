if ARGV.first == '-c'
  @comma = true
end

def rnd(x)
  s = x.to_s.size-1
  s.times.map {|i| 
    if i < s-1
      ((x * (10**i)).to_i + 1).to_f / (10**i)   
    else
      x
    end
  }.reject {|v| (v-x)/x > 0.1 }.first
end

STDIN.readlines.each do |e| 
  r = rnd(e.gsub(",", ".").to_f)
  r = r.to_s.gsub(".", ",") if @comma
  puts r
end
