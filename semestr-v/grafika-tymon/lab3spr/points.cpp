glBegin(GL_POINTS);

for(int i=0; i<N; i++){
    for(int j=0; j<N; j++){
        glVertex3fv(tab[i][j]);
    }
}

glEnd();