public void Read()
{
    while (condition)
    {
        if (k > 1000)
        {
            k = 0;
            try
            {
                string message = sp.ReadLine();
                string[] parts = message.Split(',');
                Console.WriteLine(message);
                switch (parts[0])
                {
                    case "$GPGGA": gpgga(parts); break;
                    default: message = ""; break;
                }
                Console.WriteLine(message);
            }
            catch (TimeoutException) { }
        }
        else
        {
            k++;
        }
    }
}

private void gpgga(string[] tab)
{
    if (!tab[2].Equals(""))
        textBox2.Text = string.Format("Szer : {0} st {1} min {2} sek {3} \n\r", tab[2].Substring(0, 2), tab[2].Substring(2, 2), Convert.ToInt32(tab[2].Substring(5, 3)) * 0.6, tab[3]);
    else
        textBox2.Text = "Brak szerokosci geograficznej\n";

    if (!tab[4].Equals(""))
        textBox3.Text = string.Format("Dlu : {0} st {1} min {2} sek {3} \n\r", tab[4].Substring(0, 3), tab[4].Substring(3, 2), Convert.ToInt32(tab[4].Substring(6, 3)) * 0.6, tab[5]);
    else
        textBox3.Text = "Brak dlugosci geograficznej\n";

    textBox4.Text = string.Format("Fix quality : {0}\n", tab[6]);
    textBox5.Text = string.Format("Ilosc satelit : {0}", tab[7]);
    NumberFormatInfo p = new NumberFormatInfo();
    p.NumberDecimalSeparator = ".";

    szer = Convert.ToDouble(tab[2] , p)/100;
    dl = Convert.ToDouble(tab[4], p) / 100;
    string url = string.Format("http://maps.google.com/maps?ll={0},{1}&z=10&output=embed&q={2},{3}", szer.ToString(CultureInfo.InvariantCulture), dl.ToString(CultureInfo.InvariantCulture), szer.ToString(CultureInfo.InvariantCulture), dl.ToString(CultureInfo.InvariantCulture));
    textBox6.Text = url;
    webBrowser1.Navigate(url);
}