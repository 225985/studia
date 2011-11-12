void DrawSierpIt(float a, float ax, float ay, int st)
{	//a - bok kwadratu, 
	//(ax, ay) wspolrzêdne lewego,górnego wierzcho³ka
	DrawRect(a,ax,ay);
	for(int i=0; i<st; i++)
	{

		int pow = powr(i);
		float x = a/(1.0*(pow));

		for(int j=0; j<pow; j++)
		{
			for(int k=0; k<pow; k++)
			{
				float na = a/(3*pow); //bok kwadratu wycinanego w danym stopniu trójk¹ta
				float nx = ax + (k * x) + (a/(3*pow)); // wsp³. wyciannaego kwadratu
				float ny = ay - ((j * x) + (a/(3*pow)));
				DrawBlack(na, nx, ny); // rysowanie czarnego kwadratu
			}
		}
		
	}
}