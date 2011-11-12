using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using program;

namespace BandB.GUI
{
    public partial class Form1 : Form
    {
        private string fileName = "";
        private Machine machine; 

        public Form1()
        {
            InitializeComponent();
            AcceptButton = BTLoad;
        }

        private void BTLoad_Click(object sender, EventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                fileName = dialog.FileName;
                if (!fileName.Equals(""))
                {
                    machine = new Machine(fileName);
                    TextBox.AppendText(String.Format("Loaded file : {0}\n\n", fileName));
                    TextBox.AppendText(machine.loadTasks());
                }
            }
        }

        private void BTNaiveMethod_Click(object sender, EventArgs e)
        {
            if (!fileName.Equals(""))
            {
                TextBox.AppendText("\nNaive method :\n");
                TextBox.AppendText(String.Format("Time [ms] : {0}\n", machine.naiveMethod()));
                TextBox.AppendText(String.Format("Minimal cost : {0}\n", machine.minimalCost));
                TextBox.AppendText(machine.getTasks());
            }
            else
            {
                TextBox.AppendText("Load File!!!\n");
            }
            GC.Collect();
            GC.WaitForPendingFinalizers();

        }

        private void BTFirstElimination_Click(object sender, EventArgs e)
        {
            if (!fileName.Equals(""))
            {
                TextBox.AppendText("\nFirst Elimination :\n");
                TextBox.AppendText(String.Format("Time [ms] : {0}\n", machine.firstElimination()));
                TextBox.AppendText(String.Format("Minimal cost : {0}\n", machine.minimalCost));
                TextBox.AppendText(machine.getTasks());
            }
            else
            {
                TextBox.AppendText("Load File!!!\n");
            }
            GC.Collect();
            GC.WaitForPendingFinalizers();

        }

        private void BTSecondElimination_Click(object sender, EventArgs e)
        {
            if (!fileName.Equals(""))
            {
                TextBox.AppendText("\nSecond Elimination :\n");
                TextBox.AppendText(String.Format("Time [ms] : {0}\n", machine.secondElimination()));
                TextBox.AppendText(String.Format("Minimal cost : {0}\n", machine.minimalCost));
                TextBox.AppendText(machine.getTasks());
            }
            else
            {
                TextBox.AppendText("Load File!!!\n");
            }
            GC.Collect();
            GC.WaitForPendingFinalizers();

        }
    }
}
