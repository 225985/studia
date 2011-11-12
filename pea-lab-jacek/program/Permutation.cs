using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace program
{
    public class Permutation
    {

        #region Vars
        private string [] _ResultSet;
        private int [] _InputArray;
        #endregion

        public Permutation(int [] InputSet)
        {
            _InputArray = InputSet;
            _ResultSet = new string[1];
            _ResultSet[0] = _InputArray[0].ToString();
           // Permute(_ResultSet, 1);
            per2(_InputArray, new int[InputSet.Count()], 0, new bool[InputSet.Count()]); 
        }


        #region Private Methods
        private void Permute(string [] ResultSet, int Level)
        {
            int iMain, iSub; string Holder;
            int InputElement = _InputArray[Level];
            _ResultSet = new string[Factorial(Level + 1)];
            for (iMain = 0; iMain < ResultSet.Length; iMain++)
            {

                for (iSub = 0; iSub <= ResultSet[iMain].Length; iSub++)
                {
                    Holder = ResultSet[iMain];
                    _ResultSet[iMain * (Holder.Length + 1) + iSub] = Holder.Insert(iSub, InputElement.ToString());
                }  
                
            }

            if (Level < _InputArray.Length - 1) Permute(_ResultSet, Level + 1);
        }


        private void per2(int[] task, int[] fill, int level, bool [] used)
        {
            for (int i = 0; i < task.Count(); i++)
            {
                if (!used[i])
                {
                    fill[level] = i;
                    if (level < task.Count() - 1)
                    {
                        used[i] = true;
                        per2(task, fill, level + 1, used);
                        used[i] = false;
                    }

                    else
                    {
                        for (int j = 0; j < fill.Count(); j++)
                        {
                            Console.Write("{0} ", fill[j]);
                        }
                        Console.WriteLine();
                    }
                }
            }
        
        }


        private int Factorial(int N)
        {
            return ((N <= 1) ? 1 : (N * Factorial(N - 1)));
        }
        #endregion

        #region Properties
        string [] ResultSet
        {
            get { return _ResultSet; }
        }
        int [] InputArray
        {
            get { return _InputArray; }
        }
        #endregion


        static void Main()
        {
            Permutation Permuter;
            int[] AlphaSet = { 1, 2, 3 };
            Permuter = new Permutation(AlphaSet);
            string [] d = Permuter.ResultSet;
            Console.ReadKey();
        }
    
    }

          
}
