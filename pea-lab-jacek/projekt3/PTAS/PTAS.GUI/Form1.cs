using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace PTAS.GUI
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void CountButton_Click(object sender, EventArgs e)
        {
            double eps = Convert.ToDouble(epsTextBox.Text);
            int n = Convert.ToInt32(nTextBox.Text);

            int[] tab = new int[n];
            Random rd = new Random();
            for (int i = 0; i < n; i++)
            {
                tab[i] = rd.Next(30);
            }

            var ptas = new PTAS.Repo.Ptas(tab, eps);
            ptas.ptasFunction();
            console.AppendText(ptas.getCpu());
        }
    }
}
