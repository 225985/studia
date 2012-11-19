#!/usr/bin/env ruby

# Install
# 1. $ sudo apt-get install bluetooth bluez-utils blueman ruby1.9.1 ffmpeg
# 2. edit /etc/dbus-1/system.d/bluetooth.conf
#    <policy user="root"> => <policy user="pi"> NO!!!! must stay root!!!!!!!!
# 3. sudo hciconfig hci0 up (teamon is mega idiot)
# 4. $ ruby app.rb

mac = ARGV[0] || begin
  puts "Scanning..."
  `hcitool scan`.split("\n").grep(/GPS/).first.chomp.strip.split.first
end
puts "GPS Mac address: #{mac}"
puts "Pairing with GPS device..."
system "sudo echo '0000' | sudo bluez-simple-agent hci0 #{mac}"

conn_thread = Thread.new do
  puts "Connecting to GPS devise..."
  system "rfcomm connect 0 #{mac}"
end


started = false
lat = 0
lng = 0
h = 0

eye_thread = Thread.new do
  sleep 1 until started

  loop do
    p_lat = lat
    p_lng = lng
    p_h = h
    time = Time.now
    puts "Capturing image #{time} - #{p_lat} x #{p_lng} x #{p_h}"
    system "ffmpeg -f video4linux2 -i /dev/video0 -vframes 1 img-#{time.to_i}.jpg"
    etime = Time.now
    sleep (1-(etime-time).to_f)
  end
end

dev = "/dev/rfcomm0"
loop do
  f = nil
  begin
    puts "Reading from #{dev}"
    f = File.open(dev)
    started = true
    while line = f.gets
      cmd = line.split(",")
      case cmd[0]
      when "$GPGGA"
        lat = cmd[2].to_f
        lat_d = cmd[3]
        lng = cmd[4].to_f
        lng_d = cmd[5]
        h = cmd[9].to_f
        h_d = cmd[10]
      end
    end
  rescue
    puts "Device #{dev} not ready, waiting..."
    sleep 1
  ensure
    f && f.close
  end
end
