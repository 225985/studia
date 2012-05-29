require 'digest/crc16_xmodem'

module Serial
  class Writer

    def initialize(io)
      raise ArgumentError unless io.respond_to? :write
      @io = io
    end

    def send(data = [], address = 0xffff)
      raise ArgumentError if data.length > Packet::LENGTH

      frame = [0x44, 0x00, 0x00, (address >> 8) & 0xff, address & 0xff, 0x00, 0x00,
               data.length, 0x00, 0x0c] + data
      crc = Digest::CRC16XModem.checksum frame.map(&:chr).join
      packet = Packet.new([nil] + frame + [crc & 0xff, (crc >> 8) & 0xff])
      # puts "#{Time.now} << " + packet.encode.buffer.map {|e| e.to_s(16).rjust(2) }.join(" ")
      @io.write packet.encode.to_s
    end

  end
end

