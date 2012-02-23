namespace BandB.GUI
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.BTNaiveMethod = new System.Windows.Forms.Button();
            this.BTFirstElimination = new System.Windows.Forms.Button();
            this.BTSecondElimination = new System.Windows.Forms.Button();
            this.BTThirdElimination = new System.Windows.Forms.Button();
            this.BTLoad = new System.Windows.Forms.Button();
            this.TextBox = new System.Windows.Forms.RichTextBox();
            this.SuspendLayout();
            // 
            // BTNaiveMethod
            // 
            this.BTNaiveMethod.Location = new System.Drawing.Point(12, 41);
            this.BTNaiveMethod.Name = "BTNaiveMethod";
            this.BTNaiveMethod.Size = new System.Drawing.Size(86, 23);
            this.BTNaiveMethod.TabIndex = 0;
            this.BTNaiveMethod.Text = "Naive method";
            this.BTNaiveMethod.UseVisualStyleBackColor = true;
            this.BTNaiveMethod.Click += new System.EventHandler(this.BTNaiveMethod_Click);
            // 
            // BTFirstElimination
            // 
            this.BTFirstElimination.Location = new System.Drawing.Point(12, 70);
            this.BTFirstElimination.Name = "BTFirstElimination";
            this.BTFirstElimination.Size = new System.Drawing.Size(86, 23);
            this.BTFirstElimination.TabIndex = 1;
            this.BTFirstElimination.Text = "1 elimination";
            this.BTFirstElimination.UseVisualStyleBackColor = true;
            this.BTFirstElimination.Click += new System.EventHandler(this.BTFirstElimination_Click);
            // 
            // BTSecondElimination
            // 
            this.BTSecondElimination.Location = new System.Drawing.Point(12, 99);
            this.BTSecondElimination.Name = "BTSecondElimination";
            this.BTSecondElimination.Size = new System.Drawing.Size(86, 23);
            this.BTSecondElimination.TabIndex = 2;
            this.BTSecondElimination.Text = "2 elimination";
            this.BTSecondElimination.UseVisualStyleBackColor = true;
            this.BTSecondElimination.Click += new System.EventHandler(this.BTSecondElimination_Click);
            // 
            // BTThirdElimination
            // 
            this.BTThirdElimination.Location = new System.Drawing.Point(12, 128);
            this.BTThirdElimination.Name = "BTThirdElimination";
            this.BTThirdElimination.Size = new System.Drawing.Size(86, 23);
            this.BTThirdElimination.TabIndex = 3;
            this.BTThirdElimination.Text = "3 elimination";
            this.BTThirdElimination.UseVisualStyleBackColor = true;
            this.BTThirdElimination.Click += new System.EventHandler(this.BTThirdElimination_Click);
            // 
            // BTLoad
            // 
            this.BTLoad.Location = new System.Drawing.Point(12, 12);
            this.BTLoad.Name = "BTLoad";
            this.BTLoad.Size = new System.Drawing.Size(86, 23);
            this.BTLoad.TabIndex = 4;
            this.BTLoad.Text = "Load";
            this.BTLoad.UseVisualStyleBackColor = true;
            this.BTLoad.Click += new System.EventHandler(this.BTLoad_Click);
            // 
            // TextBox
            // 
            this.TextBox.Location = new System.Drawing.Point(119, 12);
            this.TextBox.Name = "TextBox";
            this.TextBox.Size = new System.Drawing.Size(511, 290);
            this.TextBox.TabIndex = 5;
            this.TextBox.Text = "";
            // 
            // Form1
            // 
            this.AcceptButton = this.BTLoad;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(642, 314);
            this.Controls.Add(this.TextBox);
            this.Controls.Add(this.BTLoad);
            this.Controls.Add(this.BTThirdElimination);
            this.Controls.Add(this.BTSecondElimination);
            this.Controls.Add(this.BTFirstElimination);
            this.Controls.Add(this.BTNaiveMethod);
            this.Name = "Form1";
            this.Text = "B&B";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button BTNaiveMethod;
        private System.Windows.Forms.Button BTFirstElimination;
        private System.Windows.Forms.Button BTSecondElimination;
        private System.Windows.Forms.Button BTThirdElimination;
        private System.Windows.Forms.Button BTLoad;
        private System.Windows.Forms.RichTextBox TextBox;
    }
}

