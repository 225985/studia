require 'benchmark'

Benchmark.bm do |x|
  [5,6,8,9,10,11].each do |i|
    res = []
    x.report("brute #{"%2d" % i}"){ res << `./Main b #{i}` }
    x.report("one   #{"%2d" % i}"){ res << `./Main b #{i}` }
    puts res
  end
end
