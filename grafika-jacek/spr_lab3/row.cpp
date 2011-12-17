float u = 0.0, v=0.0;
    
for(int i=0; i< N; i++)
{
	for(int j=0; j<N; j++)
	{
		u = (float)i/(N-1);
        v = (float)j/(N-1);
		tab[i][j][0] =(-90 * pow(u,5.0f) + 225*pow(u,4.0f) - 270*pow(u,3.0f)+180*pow(u,2.0f)-45*u)*cos(PI * v) ;
		tab[i][j][1] = 160*pow(u,4.0f) - 320*pow(u,3.0f)+160*pow(u,2.0f) - 5.0;
		tab[i][j][2] = (-90 * pow(u,5.0f) + 225*pow(u,4.0f) - 270*pow(u,3.0f)+180*pow(u,2.0f)-45*u)*sin(PI * v);
		   
	}

}