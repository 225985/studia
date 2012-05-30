# gem instal serialport (1.9.2)
# $ ruby serial.rb /dev/tty-xxxx

$:.unshift File.expand_path '.'
require 'rubygems'
require 'serialport'
require 'lib/serial'

COMMANDS = {
  0x01 => :check_in,
  0x02 => :get_result,
  0x03 => :receive_result,
  0x04 => :refresh_routing,
  0x05 => :node_position,
  0x06 => :send_data,
  0x07 => :show_neighbourhood,
  0x08 => :neighbourhood,
  0x09 => :base
}


# "#{Time.now} #{src} ~> #{dst}: #{cmd}"

SerialPort.open ARGV.first, 57600 do |serial|
  reader = Serial::Reader.new serial

  loop do
    din = reader.read.buffer
    data = din.map {|e| e.to_s(16).rjust(2) }
    if din[1] == 0x45
      dst = din[10..11].map {|e| e.to_s(16)}.join ""
      src = din[12..13].map {|e| e.to_s(16)}.join ""
      sender = din[14..15].map {|e| e.to_s(16)}.join ""
      seq = din[16]
      cmd = din[17]



      info = if COMMANDS[cmd] == :send_data
               type = din[20]
               value = din[18..19]
               # TODO: convert values to sane units
               if type == 1
                 "temperature #{value}"
               else
                 "light #{value}"
               end
             end

      puts din.inspect

      puts " #{src} ~> #{sender} ~> #{dst}: #{COMMANDS[cmd]} #{info}"
      # elsif data[1] == "43"
      # puts "#{Time.now} >> ACK #{data.join(" ")}"
    end
  end
end
