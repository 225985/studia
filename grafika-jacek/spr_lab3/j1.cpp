void EggsPoints(){	
	glColor3f(1.0f, 1.0f, 1.0f);
	glBegin(GL_POINTS);
	for(int k=0; k<N; k++)
	{
		for(int l=0; l<N; l++)
		{
			glVertex3fv(tab[k][l]);
		}
	}
	glEnd();
}