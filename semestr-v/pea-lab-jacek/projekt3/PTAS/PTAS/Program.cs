using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PTAS
{
    class Program
    {
        static void Main(string[] args)
        {
            var rand = new Random();
            //changing eps
            
            System.IO.StreamWriter file = new System.IO.StreamWriter("d:\\test.txt");
            file.WriteLine("changing eps");
            file.WriteLine("n eps time");
          
            for (int i = 100; i < 30000; i += 5000)
            {
                int[] t = new int[i];
                for (int k = 0; k < i; k++)
                {
                    t[k] = rand.Next(100);
                }
                for (double j = 0.5; j >= 0.05; j -= 0.05)
                {
                    Console.WriteLine(string.Format("{0} {1}", i, j));
                    var ptas = new PTAS.Repo.Ptas(t, j);
                    long time = 0;
                    for (int p = 0; p < 3; p++)
                    {
                        time += ptas.ptasFunction();
                    }
                    file.WriteLine(string.Format("{0} {1} {2}", i, j, time/3.0));
                }
            }

            file.Close();            
        }
    }
}
