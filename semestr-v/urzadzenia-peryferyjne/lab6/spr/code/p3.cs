...
InitializeITEM();//inicjuje ustawienia skanera      
Img = (ImageFile)Dialog1.ShowTransfer(Scanner.Items[1], wiaFormatBMP, true);
imageBytes = (byte[])Img.FileData.get_BinaryData(); 
MemoryStream ms = new MemoryStream(imageBytes);
Image image = Image.FromStream(ms);
pictureBox1.Image = image;
...