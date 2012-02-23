sp = new SerialPort();

sp.PortName = "COM120";
sp.BaudRate = 9600; 
sp.Parity = Parity.None;
sp.DataBits = 8;
sp.StopBits = StopBits.One; 
sp.Handshake = Handshake.None; 
sp.ReadTimeout = 1000;
sp.WriteTimeout = 1000;

sp.Open();