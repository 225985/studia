module Serial
  class Packet
    attr_accessor :buffer

    LENGTH = 28 # TinyOS packet limit

    # create new packet with buffer
    def initialize(data = [])
      @buffer = Array(data)
    end

    # return HDLC encoded packet
    def encode
      encoded = buffer[1..-1].reduce([]) do |acc, byte|
        if byte == 0x7e or byte == 0x7d
          acc << 0x7d << (byte ^ 0x20)
        else
          acc << byte
        end
      end
      Packet.new([0x7e] + encoded + [0x7e])
    end

    # return HDLC decoded packet
    def decode
      state = :normal
      decoded = buffer.reduce [] do |acc, byte|
        case state
        when :normal
          if byte == 0x7d
            state = :special
          else
            acc << byte
          end
        when :special
          state = :normal
          acc << (byte ^ 0x20)
        end
        acc
      end
      Packet.new decoded
    end

    def <<(byte)
      buffer << byte
    end

    def inspect
      buffer.map do |byte|
        byte.to_s(16).rjust 2, '0'
      end.join ' '
    end

    def to_s
      buffer.map(&:chr).join
    end

    def to_a
      buffer
    end

  end
end
