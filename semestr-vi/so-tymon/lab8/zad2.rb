#!/usr/bin/env ruby
# Kopie drzewa w zadanej pozycji zachowujac poprawnosc dowiazan sym.
#

if ARGV.size < 2
  puts "Usage: $0 DIRA DIRB"
  exit 1
end


dir = File.realpath(ARGV.first)

Dir["#{dir}/**/*"].each do |path|
  if File.symlink?(path)
    real = File.realpath(path)
    if File.file?(real)
      s = File.stat(real)
      if s.writable? && (s.mode & 1 == 0 || s.mode & 8 == 0)
        bn = File.basename(path)
        (files[bn] ||= []) << path
      end
    end
  else
    if File.directory?(path)
      # skip
    end
  end

  real = File.realpath(path)

  puts path
  puts real

  # if File.file?(path)



end
