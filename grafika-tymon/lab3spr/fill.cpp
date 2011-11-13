glBegin(GL_TRIANGLES);

for(int i=0; i<N/2; i++){
    for(int j=0; j<N-1; j++){
        glColor3fv(color[i][j]);
        glVertex3fv(tab[i][j]);

        glColor3fv(color[i+1][j]);
        glVertex3fv(tab[i+1][j]);

        glColor3fv(color[i][j+1]);
        glVertex3fv(tab[i][j+1]);

        glColor3fv(color[i][j+1]);
        glVertex3fv(tab[i][j+1]);

        glColor3fv(color[i+1][j+1]);
        glVertex3fv(tab[i+1][j+1]);

        glColor3fv(color[i+1][j]);
        glVertex3fv(tab[i+1][j]);
    }
}

for(int i=N-1; i>N/2; i--){
    for(int j=0; j<N-1; j++){
        glColor3fv(color[i][j]);
        glVertex3fv(tab[i][j]);

        glColor3fv(color[i-1][j]);
        glVertex3fv(tab[i-1][j]);

        glColor3fv(color[i][j+1]);
        glVertex3fv(tab[i][j+1]);

        glColor3fv(color[i][j+1]);
        glVertex3fv(tab[i][j+1]);

        glColor3fv(color[i-1][j+1]);
        glVertex3fv(tab[i-1][j+1]);

        glColor3fv(color[i-1][j]);
        glVertex3fv(tab[i-1][j]);
    }
}

glEnd();
