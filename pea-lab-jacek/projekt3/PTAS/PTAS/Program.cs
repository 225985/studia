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
            int []t = new int[10];
            var rand = new Random();
            for (int i = 0; i < 10; i++)
            {
                t[i] = rand.Next(20);
            }
            double eps = 0.1;

            var ptas = new PTAS.Repo.Ptas(t, eps);

            ptas.ptasFunction();
            System.Console.WriteLine(ptas.getTotalTime());
            
            System.Console.Write("m1: ");
            foreach (var item in ptas.getCpu(false))
            {
                System.Console.Write(item + ", ");
            }
            System.Console.WriteLine();
            System.Console.Write("m2: ");
            foreach (var item in ptas.getCpu(true))
            {
                System.Console.Write(item + ", ");
            }
            Console.ReadKey();
        }
    }
}
