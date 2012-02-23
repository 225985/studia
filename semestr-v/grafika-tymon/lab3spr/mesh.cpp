glBegin(GL_LINES);

for(int i=0; i<N-1; i++){
    for(int j=0; j<N-1; j++){
        glVertex3fv(tab[i][j]);
        glVertex3fv(tab[i+1][j]);

        glVertex3fv(tab[i][j]);
        glVertex3fv(tab[i][j+1]);
    }
}

glEnd();