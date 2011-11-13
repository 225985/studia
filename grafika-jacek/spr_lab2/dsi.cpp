void DrawSierpIt(float a, float ax, float ay, int st)
{	//a - bok kwadratu, 
	//(ax, ay) wspolrz�dne lewego,g�rnego wierzcho�ka
	DrawRect(a,ax,ay);
	for(int i=0; i<st; i++)
	{

		int pow = powr(i);
		float x = a/(1.0*(pow));

		for(int j=0; j<pow; j++)
		{
			for(int k=0; k<pow; k++)
			{
				float na = a/(3*pow); //bok kwadratu wycinanego w danym stopniu tr�jk�ta
				float nx = ax + (k * x) + (a/(3*pow)); // wsp�. wyciannaego kwadratu
				float ny = ay - ((j * x) + (a/(3*pow)));
				DrawBlack(na, nx, ny); // rysowanie czarnego kwadratu
			}
		}
		
	}
}