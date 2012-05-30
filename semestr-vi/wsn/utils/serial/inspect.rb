# gem instal serialport (1.9.2)
# $ ruby serial.rb /dev/tty-xxxx

$:.unshift File.expand_path '.'
require 'rubygems'
require 'serialport'
require 'lib/serial'

@ng = {}

def color(i)
  case i
  when " ?"
    i
  when " 0"
    "\033[31m" + i + "\033[0m"
  else
    "\033[32m" + i + "\033[0m"
  end
end


def clear
  puts "\e[H\e[2J"
end

def print_ng
  clear
  puts Time.now
  puts
  s=(1..9).map {|e| e.to_s.rjust(2) }.join(" | ")
  puts "## | $$ | #{s}"
  puts "-" * 53
  @ng.sort_by { |k,v| k }.each do |i, v|
    e = v[:data]
    t = v[:time]
    s=(e || Array.new(10){"?"}).map {|e| color(e.to_s.rjust(2)) }.join(" | ")
    r = "." * v[:rec]
    a = ("%.2f" % (Time.now - t)) + " seconds ago"
    puts "#{i.to_s.rjust(2)} | " + s + " > #{t} (#{a}) " + r
  end
  puts
end

SerialPort.open ARGV.first, 57600 do |serial|
  reader = Serial::Reader.new serial
  writer = Serial::Writer.new serial

  puts "init"

  Thread.new do
    loop do
      begin
        system "stty raw -echo"
        code = STDIN.read_nonblock 1
      rescue Errno::EAGAIN
        code = " "
      ensure
        system "stty -raw -echo"
      end

      case code
      when "u"
        puts "refresh routing"
        # broadcast CMD_REFRESH_ROUTING
        writer.send("ff ff aa aa  0  1  0  a 30 31 32 33 34 35 36 37 38 39  0  0  0  0  0  0  0  0  0  0".split.map {|e| e.to_i(16)})
      else
        puts "neighbourhood"
        # broadcast CMD_SHOW_NEIGHBOURHOOD
        writer.send("ff ff aa aa  0  1  0  7 30 31 32 33 34 35 36 37 38 39  0  0  0  0  0  0  0  0  0  0".split.map {|e| e.to_i(16)})
      end

      sleep 5
    end
  end

  loop do
    din = reader.read.buffer
    data = din.map {|e| e.to_s(16).rjust(2) }
    if data[1] == "45"

      src = (din[14] << 8) | din[15]
      @ng[src] ||= {:rec => 0}
      @ng[src][:data] = data[18..27]
      @ng[src][:time] = Time.now
      @ng[src][:rec] += 1

      data[10] = "\033[32m" + data[10]
      data[17] = "\033[31m" + data[17]
      data[18] = "\033[33m" + data[18]
      data[38] = "\033[0m" + data[38]
      # puts "#{Time.now} >> #{data.join(" ")}"
    elsif data[1] == "43"
      # puts "#{Time.now} >> ACK #{data.join(" ")}"
    end

    print_ng
  end
end
