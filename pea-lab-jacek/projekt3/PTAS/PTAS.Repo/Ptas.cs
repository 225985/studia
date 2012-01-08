using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace PTAS.Repo
{
    public class Ptas
    {
        public int[] tasks { get; set; }
        public int tasksCount { get; set; }
        public double eps { get; set; }
        public int k { get; set; }
        public int[] costs { get; set; }
        public bool[] optimal { get; set; }
        public int best { get; set; }

        public Ptas(int [] tasks, double eps)
        {
            this.tasks = tasks;
            tasksCount = this.tasks.Count();
            this.eps = eps;
            costs = new int[2];
            this.k = countK() > tasksCount ? tasksCount : countK();
            this.optimal = new bool[tasksCount];
        }

        private int countK()
        {
            return Convert.ToInt32(Math.Ceiling((1/eps) - 2));
        }

        private bool getPermutation(bool[] tab)
        {
            for(int i=0; i < k; i++){
                if (tab[i])
                {
                    tab[i] = false;
                }
                else
                {
                    tab[i] = true;
                    return true;
                }
            }
            return false;
        }

        private int getTime(bool[] tab, int index)
        {
            int p1 = 0, p2 = 0;

            for (int i = 0; i < index; i++)
            {
                if (tab[i])
                {
                    p1 += tasks[i];
                }
                else
                {
                    p2 += tasks[i];
                }
            }
            return Math.Max(p1, p2);
        }

        private bool freeCpu(int index)
        {
            int p1 = 0, p2 = 0;
            for (int i = 0; i < index; i++)
            {
                if (optimal[i])
                {
                    p1 += tasks[i];
                }
                else
                {
                    p2 += tasks[i];
                }
            }
            return p1 > p2 ? true : false;
        }

        public long ptasFunction()
        {
            bool [] tmp = new bool[tasksCount];

            Stopwatch counter = new Stopwatch();
            counter.Reset();
            counter.Start();

            Array.Sort(tasks);
            Array.Reverse(tasks);

            if (!(eps > 1.0/3.0))
            {
                best = getTime(tmp, k);
                while (getPermutation(tmp))
                {
                    int tmpTime = getTime(tmp, k);
                    if (best > tmpTime)
                    {
                        best = tmpTime;
                        Array.Copy(tmp, optimal, k);
                    }
                }
            }
            else
            {
                k = 0;
            }
            for (int i = k; i < tasksCount; i++)
            {
                if (!freeCpu(i + 1))
                {
                    optimal[i] = true;   
                }
            }
            return counter.ElapsedMilliseconds;
        }

        public List<int> getCpu(bool which)
        {
            var cpu = new List<int>(tasksCount);
         
                for (int i = 0; i < tasksCount; i++)
                {
                    if (optimal[i] == !which)
                    {
                        cpu.Add(tasks[i]);
                    }
                }
        
            return cpu;
        }

        public int getTotalTime()
        {
            return getTime(optimal, tasksCount);
        }

        public string getCpu()
        {
            string result1 = "m1: ";
            string result2 = "m2: ";
            for (int i = 0; i < tasksCount - 1; i++)
            {
                if (optimal[i])
                {
                    result1 += string.Format("{0}, ", tasks[i]);
                } 
                else 
                {
                    result2 += string.Format("{0}, ", tasks[i]);
                }
            }
            if (result1 != "m1: ") result1.Remove(result1.Length - 2);
            if (result2 != "m2: ") result1.Remove(result1.Length - 2);
            return result1 + "\n" + result2 + "\n";
        }
    }
}
