require "benchmark"

Benchmark.bm do |x|
  [10,20,30,40].each do |n|
    [0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.2, 0.3].each do |e|
      x.report("#{n} #{"%.2f" % e}") { system "./main #{n} #{e} > /dev/null" }
    end
  end
end
