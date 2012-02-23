using System;
using System.IO.Ports;
using System.Threading;


namespace ConsoleApplication1
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


            sp.PortName = SetPortName(sp.PortName);
            sp.BaudRate = SetPortBaudRate(sp.BaudRate);
            sp.Parity = SetPortParity(sp.Parity);
            sp.DataBits = SetPortDataBits(sp.DataBits);
            sp.StopBits = SetPortStopBits(sp.StopBits);
            sp.Handshake = SetPortHandshake(sp.Handshake);


            sp.ReadTimeout = 1000;
            sp.WriteTimeout = 1000;

            sp.Open();
            condition = true;
            readThread.Start();


            while (condition)
            {
                message = Console.ReadLine();
                if (message.Equals("q")) condition = false;
                else sp.WriteLine(String.Format("{0}\r", message));
               
            }

            readThread.Join();
            sp.Close();

        }

        public static void Read()
        {
            while (condition)
            {
                try
                {
                    string message = sp.ReadLine();
                    Console.WriteLine(message);
                }
                catch (TimeoutException) { }
            }
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
