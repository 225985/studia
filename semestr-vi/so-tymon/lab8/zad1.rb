#!/usr/bin/env ruby
# w zadanym drzewie katalogow wylistowac pliki regularne do
# ktorych wlasciciel ma prawo zapisu, a grupa lub inni nie maja prawa wykonania,
# o najczesciej wystepujacej nazwie

if ARGV.size < 1
  puts "Usage: $0 FILE"
  exit 1
end

dir = File.realpath(ARGV.first)

name, paths = Dir["#{dir}/**/*"].inject({}) do |files, path|
  real = File.realpath(path)
  if File.file?(real)
    s = File.stat(real)
    if s.writable? && (s.mode & 1 == 0 || s.mode & 8 == 0)
      bn = File.basename(path)
      (files[bn] ||= []) << path
    end
  end

  files
end.sort_by {|k,v| -v.length }.first

puts name
paths.each do |path|
  puts path
end
