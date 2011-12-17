using System;
using System.IO.Ports;
using System.Threading;


namespace ConsoleApplication2
{
    class Program
    {
        static bool condition;
        static SerialPort sp;

        static void Main(string[] args)
        {
            string message;
            StringComparer stringComparer = StringComparer.OrdinalIgnoreCase;
            Thread readThread = new Thread(Read);


            sp = new SerialPort();


            sp.PortName = "COM120";//; SetPortName(sp.PortName);
            sp.BaudRate = 9600; // SetPortBaudRate(sp.BaudRate);
            sp.Parity = Parity.None;// SetPortParity(sp.Parity);
            sp.DataBits = 8;// SetPortDataBits(sp.DataBits);
            sp.StopBits = StopBits.One; // SetPortStopBits(sp.StopBits);
            sp.Handshake = Handshake.None; // SetPortHandshake(sp.Handshake);


            sp.ReadTimeout = 1000;
            sp.WriteTimeout = 1000;

            sp.Open();
            condition = true;
            readThread.Start();


            while (condition)
            {
               

            }

            readThread.Join();
            sp.Close();

        }
        //static string[] parts;
        public static void Read()
        {
            while (condition)
            {
                try
                {
                    string message = sp.ReadLine();
                    string [] parts = message.Split(',');
                    Console.WriteLine(message);
                    switch (parts[0])
                    {
                        case "$GPGGA": message = gpgga(parts); break;
                        case "$GPGSA": message = "";  break;
                        case "$GPGSV": message = ""; break;
                        case "$GPRMC": message = ""; break;
                        default: message = ""; break;
                    }

                    Console.WriteLine(message);
                }
                catch (TimeoutException) { }
            }
        }

        private static string gpgga(string [] tab)
        {
            string result = "";
            if (!tab[2].Equals(""))
                result += string.Format("Szer : {0} st {1} min {2} sek {3} \n\r", tab[2].Substring(0, 2), tab[2].Substring(2, 2), Convert.ToInt32(tab[2].Substring(5, 3)) * 0.6, tab[3]);
            else
                result += "Brak szerokosci geograficznej\n";

            if (!tab[4].Equals(""))
                result += string.Format("D³u : {0} st {1} min {2} sek {3} \n\r", tab[4].Substring(0, 3), tab[4].Substring(3, 2), Convert.ToInt32(tab[4].Substring(6, 3)) * 0.6, tab[5]);
            else
                result += "Brak d³ugosci geograficznej\n";

            result += string.Format("Fix quality : {0}\n",tab[6]);
            result += string.Format("Iloœæ satelit : {0}", tab[7]);
            return result;
        }

        public static string SetPortName(string defaultPortName)
        {
            string portName;

            Console.WriteLine("Available Ports:");
            foreach (string s in SerialPort.GetPortNames())
            {
                Console.WriteLine("   {0}", s);
            }

            Console.Write("COM port({0}): ", defaultPortName);
            portName = Console.ReadLine();

            if (portName == "")
            {
                portName = defaultPortName;
            }
            return portName;
        }

        public static int SetPortBaudRate(int defaultPortBaudRate)
        {
            string baudRate;

            Console.Write("Baud Rate({0}): ", defaultPortBaudRate);
            baudRate = Console.ReadLine();

            if (baudRate == "")
            {
                baudRate = defaultPortBaudRate.ToString();
            }

            return int.Parse(baudRate);
        }

        public static Parity SetPortParity(Parity defaultPortParity)
        {
            string parity;

            Console.WriteLine("Available Parity options:");
            foreach (string s in Enum.GetNames(typeof(Parity)))
            {
                Console.WriteLine("   {0}", s);
            }

            Console.Write("Parity({0}):", defaultPortParity.ToString());
            parity = Console.ReadLine();

            if (parity == "")
            {
                parity = defaultPortParity.ToString();
            }

            return (Parity)Enum.Parse(typeof(Parity), parity);
        }

        public static int SetPortDataBits(int defaultPortDataBits)
        {
            string dataBits;

            Console.Write("Data Bits({0}): ", defaultPortDataBits);
            dataBits = Console.ReadLine();

            if (dataBits == "")
            {
                dataBits = defaultPortDataBits.ToString();
            }

            return int.Parse(dataBits);
        }

        public static StopBits SetPortStopBits(StopBits defaultPortStopBits)
        {
            string stopBits;

            Console.WriteLine("Available Stop Bits options:");
            foreach (string s in Enum.GetNames(typeof(StopBits)))
            {
                Console.WriteLine("   {0}", s);
            }

            Console.Write("Stop Bits({0}):", defaultPortStopBits.ToString());
            stopBits = Console.ReadLine();

            if (stopBits == "")
            {
                stopBits = defaultPortStopBits.ToString();
            }

            return (StopBits)Enum.Parse(typeof(StopBits), stopBits);
        }

        public static Handshake SetPortHandshake(Handshake defaultPortHandshake)
        {
            string handshake;

            Console.WriteLine("Available Handshake options:");
            foreach (string s in Enum.GetNames(typeof(Handshake)))
            {
                Console.WriteLine("   {0}", s);
            }

            Console.Write("Handshake({0}):", defaultPortHandshake.ToString());
            handshake = Console.ReadLine();

            if (handshake == "")
            {
                handshake = defaultPortHandshake.ToString();
            }

            return (Handshake)Enum.Parse(typeof(Handshake), handshake);
        }


    }
}
