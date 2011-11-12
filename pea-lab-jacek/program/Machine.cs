using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;
using System.Diagnostics;

namespace program
{
    public class Machine
    {
         List<Task> tasks { get; set; }
        public string fileName { get; set; }
        public int minimalCost { get; set; }
        private int[] per;

        public Machine(string fileName)
        {
            this.fileName = fileName;
            tasks = new List<Task>();
        }


        public string loadTasks()
        {
            string table = "p[j]\td[j]\tw[j]\n";
            string[] lines = File.ReadAllLines(@fileName);
            Regex spaces = new Regex(@"\s+");
            foreach (var item in lines)
            {
                string[] items = spaces.Split(item);
                table += String.Format("{0}\t{1}\t{2}\n", items[0], items[1], items[2]);
                tasks.Add(new Task() { 
                    p = Convert.ToInt32(items[0]),
                    d = Convert.ToInt32(items[1]),
                    w = Convert.ToInt32(items[2])
                });
            }
            per = new int[tasks.Count];
            return table;
        }


        public long naiveMethod()
        {
           
            minimalCost = 0;
            Stopwatch counter = new Stopwatch();
            counter.Reset();
            counter.Start();
            minimalCost = countCost(tasks);
            permutation(tasks.Count, new int[tasks.Count], 0, new bool[tasks.Count]);
            return counter.ElapsedMilliseconds;
        }

        private void permutation(int n, int[] fill, int level, bool[] used)
        {
            for (int i = 0; i < n; i++)
            {
                if (!used[i])
                {
                    fill[level] = i;
                    if (level < n - 1)
                    {
                        used[i] = true;
                        permutation(n, fill, level + 1, used);
                        used[i] = false;
                    }

                    else
                    {
                        int cost = countCost(fill, n);
                        if (minimalCost > cost)
                        {
                            minimalCost = cost;
                            Array.Copy(fill, per, n);
                        }
                    }
                }
            }

        }

        public long firstElimination()
        {

            minimalCost = 0;
            Stopwatch counter = new Stopwatch();
            counter.Reset();
            counter.Start();
            minimalCost = countCost(tasks);
            countFirstElimination(tasks.Count, new int[tasks.Count], 0, new bool[tasks.Count]);
            return counter.ElapsedMilliseconds;
        }


        private void countFirstElimination(int n, int[] fill, int level, bool[] used)
        {
            for (int i = 0; i < n; i++)
            {
                if (!used[i])
                {
                    fill[level] = i;
                    int[] helpTab = new int[level + 1];
                    Array.Copy(fill, helpTab, level + 1);
                    if (level < n - 1 && minimalCost > countCost(helpTab, level +1))
                    {
                        used[i] = true;
                        permutation(n, fill, level + 1, used);
                        used[i] = false;
                    }

                    else
                    {
                        int cost = countCost(fill, n);
                        if (minimalCost > cost)
                        {
                            minimalCost = cost;
                            Array.Copy(fill, per, n);
                        }
                    }
                }
            }

        }

        public long secondElimination()
        {

            minimalCost = 0;
            Stopwatch counter = new Stopwatch();
            counter.Reset();
            counter.Start();
            minimalCost = countCost(tasks);
            countSecondElimination(tasks.Count, new int[tasks.Count], 0, new bool[tasks.Count]);
            return counter.ElapsedMilliseconds;
        }

        private void countSecondElimination(int n, int[] fill, int level, bool[] used)
        {
            for (int i = 0; i < n; i++)
            {
                if (!used[i])
                {
                    fill[level] = i;
                    int[] helpTab = new int[level + 1];
                    Array.Copy(fill, helpTab, level + 1);
                    int tmpCost = countCost(helpTab, level+1);
                    if (level < n - 1 && minimalCost > tmpCost && checkSecondElimination(helpTab, tmpCost, level+1))
                    {
                        used[i] = true;
                        permutation(n, fill, level + 1, used);
                        used[i] = false;
                    }

                    else
                    {
                        int cost = countCost(fill, n);
                        if (minimalCost > cost)
                        {
                            minimalCost = cost;
                            Array.Copy(fill,per,n);
                        }
                    }
                }
            }

        }

        private bool checkSecondElimination(int[] tab, int cost, int n)
        {
            int[] tmpTab = new int[tab.Count()];

            Array.Copy(tab, tmpTab, tab.Count());
            for (int i = tab.Count() - 1; i > 0; i--)
            {
                int tmp = tmpTab[i];
                tmpTab[i] = tmpTab[i - 1];
                tmpTab[i - 1] = tmp;
                if (cost > countCost(tmpTab, n))
                    return false;
            }
            return true;
        }



        private int countCost(List<Task> list)
        {
            int time = 0, cost = 0;
            foreach (var item in list)
            {
                time += item.p;
                cost += Math.Max(0, time - item.d) * item.w;
            }
            return cost;
        }
        

        private int countCost(int [] tab, int n)
        {
            int time = 0, cost = 0;

            for (int i = 0; i < n; i++)
            {
                
                time += tasks[tab[i]].p;
                cost += Math.Max(0, time - tasks[tab[i]].d) * tasks[tab[i]].w;
            }
            return cost;
        }
                
       

        public string getTasks()
        {
            string t = "";
            foreach (var item in per)
            {
                t += (item+1) + " "; 
            }
            return t;
        }

        
    }
}
