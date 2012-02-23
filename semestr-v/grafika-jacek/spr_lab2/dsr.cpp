void DrawOneSierp(float a, float ax, float ay, int st){
	if(st == 0){
		DrawRect(a,ax,ay);
	} else {
		float x = a/3;
		for(int i=0; i<3; i++)
		{
			for(int j=0; j<3; j++)
			{
				if(3*i + j != 4)
				{
					DrawOneSierp(x, ax + j*x, ay - i*x, st-1);		
				}
			}
		}
	}
}