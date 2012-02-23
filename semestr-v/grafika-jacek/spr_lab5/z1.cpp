for(int i=0; i< N; i++)
{
	for(int j=0; j<N; j++)
	{
		u = (float)i/(N-1);
        v = (float)j/(N-1);
		tab[i][j][0] =(-90 * pow(u,5.0f) + 225*pow(u,4.0f) - 270*pow(u,3.0f)+180*pow(u,2.0f)-45*u)*cos(PI * v) ;
		tab[i][j][1] = 160*pow(u,4.0f) - 320*pow(u,3.0f)+160*pow(u,2.0f) - 5.0;
		tab[i][j][2] = (-90 * pow(u,5.0f) + 225*pow(u,4.0f) - 270*pow(u,3.0f)+180*pow(u,2.0f)-45*u)*sin(PI * v);
		
		xu = (-450*pow(u,4) + 900*pow(u,3) - 810*pow(u,2) + 360*u - 45)*cos(PI * v);
		yu = 640*pow(u,3) - 960*pow(u,2) + 320*u;
		zu = (-450*pow(u,4) + 900*pow(u,3) - 810*pow(u,2) + 360*u - 45)*sin(PI * v);

		xv = PI * (90*pow(u,5) - 225*pow(u,4) + 270*pow(u,3) - 180*pow(u,2) + 45*u)*sin(PI * v);
		yv = 0;
		zv =  -PI * (90*pow(u,5) - 225*pow(u,4) + 270*pow(u,3) - 180*pow(u,2) + 45*u)*cos(PI * v);
			
		nor[i][j][0] = (yu * zv - zu * yv);
		nor[i][j][1] = (zu * xv - xu * zv);
		nor[i][j][2] = (xu * yv - yu * xv);

		float len = sqrt(pow(nor[i][j][0],2) + pow(nor[i][j][1],2) + pow(nor[i][j][2],2));
		for(int k=0; k<3; k++)
			nor[i][j][k] /= len;
		}

	}

for(int i=N/2; i<N;i++)
	for(int j=0; j<N; j++)
		for(int k=0; k<3; k++)
			nor[i][j][k] *= -1;