# TinyOS frame reader
module Serial
  class Reader

    # +io+ object has to supply +each_byte+ method
    def initialize(io)
      raise ArgumentError unless io.respond_to? :each_byte
      @io = io
    end

    # Get HDLC decoded packet from +@io+
    def read
      Packet.new(readpacket.decode)
    end

    # Get raw packet from +@io+
    def readpacket
      packet = Packet.new
      state = :idle
      @io.each_byte do |byte|
        case state
        when :idle
          state = :start if byte == 0x7e # frame start
        when :start
          unless byte == 0x7e # is it start or was it stop?
            state = :data
            packet << 0x7e << byte
          end
        when :data
          packet << byte
          if byte == 0x7e # frame end
            state = :done
            break
          end
        end
      end
      packet
    end

  end
end

