using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace program
{
    abstract class Solver
    {
        public List<Task> tasks { get; set; }
        public List<int> result { get; set; }
        public int minimalCost { get; set; }

        public abstract void solveProblem();

        public string getResult()
        {
            string result = "minimal cost : " + this.minimalCost + "\n";
            foreach (var item in this.result)
            {
                result += String.Format("{0} ", item);
            }

            return result;
        }
        
    }
}
