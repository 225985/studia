require 'benchmark'

opts = "+RTS -K1024000000 -RTS"

Benchmark.bm do |x|
  [5,6,8,9,10,11,12,13,15,17,18].each do |i|
    res = []
    # x.report("brute #{"%2d" % i}"){ res << `./Main #{opts} 0 #{i}` }
    # x.report("one   #{"%2d" % i}"){ res << `./Main #{opts} 1 #{i}` }
    x.report("two   #{"%2d" % i}"){ res << `./Main #{opts} 2 #{i}` }
    puts res
  end
end
