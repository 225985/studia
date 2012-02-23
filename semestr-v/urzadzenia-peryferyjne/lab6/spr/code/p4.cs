private void button2_Click(object sender, EventArgs e)
{
    if (pictureBox1.Image != null)
    {

        FileStream file = File.OpenWrite("d.bmp");
        file.Write(imageBytes,0,imageBytes.Length);
        file.Close();
        MessageBox.Show("zapisano");
    }
}