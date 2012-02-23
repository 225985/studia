readlines.join.split("\n\n").each do |m|
  puts m.split("\n").first
  a = m.split("\n").each_slice(11).map do |slice|
    if slice.size == 11
      # puts slice[0]
      slice[1, 10].map do |line|
        m = line.match(/\[ ?(\d+.\d+)%\]/)
        m[1].to_f
      end
    else
      []
    end
  end.flatten

  xs = a.partition {|e| e < 1 }

  puts "#{a.size}: #{xs[0].size} | #{xs[1].size}"
end
