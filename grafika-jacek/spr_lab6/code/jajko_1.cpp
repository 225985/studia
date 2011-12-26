if(status == 1)                    // je?li lewy klawisz myszy wci?ni?ty
{
	thetax += delta_x * pix2angle / 30.0;
	thetay += delta_y * pix2angle / 30.0;
}  
else if(status ==2)
{
	theta_zoom += delta_zoom/10.0;
}

if(thetay > 3.1415) 
	thetay -= 2*3.1415;
else if(thetay <= -3.1415) 
	thetay += 2*3.1415;

if(thetay > 3.1415/2 || thetay < -3.1415/2)
{
	p = -1.0;
} 
else
{
p = 1.0;
}


viewer[0] = theta_zoom*cos(thetax)*cos(thetay);
viewer[1] = theta_zoom*sin(thetay);
viewer[2] = theta_zoom*sin(thetax)*cos(thetay);

EggsTriangles();

//funkcja EggsTriangles

void EggsTriangles(){
	float div = N * 1.0f;
	for(int i=0; i<N-1; i++){
        for(int j=0; j<N-1; j++)
		{
			glBegin(GL_TRIANGLES);
			//glColor3fv(col[i][j]);
			glNormal3fv(nor[i][j]);
			glTexCoord2f(i / div, j/div);
			glVertex3fv(tab[i][j]);
				
				
			//glColor3fv(col[i+1][j]);
			glNormal3fv(nor[i+1][j]);
			glTexCoord2f((i+1)/div, j/div);
			glVertex3fv(tab[i+1][j]);
				
				
			//glColor3fv(col[i][j+1]);
			glNormal3fv(nor[i][j+1]);
			glTexCoord2f(i/div, (j+1)/div);
			glVertex3fv(tab[i][j+1]);
			glEnd();

			glBegin(GL_TRIANGLES);
			
			glNormal3fv(nor[i+1][j+1]);
			glTexCoord2f((i+1)/div, (j+1)/div);
			glVertex3fv(tab[i+1][j+1]);
				
				
			//glColor3fv(col[i+1][j]);
			glNormal3fv(nor[i+1][j]);
			glTexCoord2f((i+1)/div, j/div);
			glVertex3fv(tab[i+1][j]);
				
				
			//glColor3fv(col[i][j+1]);
			glNormal3fv(nor[i][j+1]);
			glTexCoord2f(i/div, (j+1)/div);
			glVertex3fv(tab[i][j+1]);
			glEnd();
		}
    }
}