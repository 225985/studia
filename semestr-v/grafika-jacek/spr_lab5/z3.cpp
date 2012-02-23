void EggsTriangles(){
	glBegin(GL_TRIANGLES);
	for(int i=0; i<N-1; i++){
        for(int j=0; j<N-1; j++)
		{
			glBegin(GL_TRIANGLES);
	
			glNormal3fv(nor[i][j]);
			glVertex3fv(tab[i][j]);
			
			glNormal3fv(nor[i+1][j]);
			glVertex3fv(tab[i+1][j]);
			
			glNormal3fv(nor[i][j+1]);
			glVertex3fv(tab[i][j+1]);
			glEnd();

			glBegin(GL_TRIANGLES);
			
			glNormal3fv(nor[i+1][j+1]);
			glVertex3fv(tab[i+1][j+1]);
			
			glNormal3fv(nor[i+1][j]);
			glVertex3fv(tab[i+1][j]);
			
			glNormal3fv(nor[i][j+1]);
			glVertex3fv(tab[i][j+1]);
			glEnd();
		}
	}
	glEnd();
}