// Obliczenie punktow jajka oraz wektorow normalnych
void calc(){
  float u = 0.0, v=0.0;

  for(int i=0; i< N; i++){
    u = ((float)i)/(N-1);
    for(int j=0; j<N; j++){
      v = ((float)j)/(N-1);
      tab[i][j][0] = (-90*pow(u, 5.0) + 225*pow(u, 4.0) - 270*pow(u, 3.0) + 180*pow(u, 2.0) - 45*u) * cos(3.14 * v) ;
      tab[i][j][1] =  160*pow(u, 4.0) - 320*pow(u, 3.0) + 160*pow(u, 2.0) - 5.0;
      tab[i][j][2] = (-90*pow(u, 5.0) + 225*pow(u, 4.0) - 270*pow(u, 3.0) + 180*pow(u, 2.0) - 45*u) * sin(3.14 * v);

      GLfloat xu = (-450*pow(u,4) + 900*pow(u,3) - 810*pow(u,2) + 360*u - 45)*cos(3.14 * v);
      GLfloat yu = 640*pow(u,3) - 960*pow(u,2) + 320*u;
      GLfloat zu = (-450*pow(u,4) + 900*pow(u,3) - 810*pow(u,2) + 360*u - 45)*sin(3.14 * v);

      GLfloat xv = 3.14 * (90*pow(u,5) - 225*pow(u,4) + 270*pow(u,3) - 180*pow(u,2) + 45*u)*sin(3.14 * v);
      GLfloat yv = 0;
      GLfloat zv = -3.14 * (90*pow(u,5) - 225*pow(u,4) + 270*pow(u,3) - 180*pow(u,2) + 45*u)*cos(3.14 * v);

      normal[i][j][0] = yu*zv - zu*yv;
      normal[i][j][1] = zu*xv - xu*zv;
      normal[i][j][2] = xu*yv - yu*xv;

      GLfloat len = sqrt(pow(normal[i][j][0],2) + pow(normal[i][j][1],2) + pow(normal[i][j][2],2));
      normal[i][j][0] /= len;
      normal[i][j][1] /= len;
      normal[i][j][2] /= len;

      if(i >= N/2) {
        normal[i][j][0] *= -1;
        normal[i][j][1] *= -1;
        normal[i][j][2] *= -1;
      }
    }
  }
}

// Fragment funkcji rysujacej jajko
for(int i=0; i<N/2; i++){
    for(int j=0; j<N-1; j++){
        glNormal3fv(normal[i][j]);
        glTexCoord2f(i/NF, j/NF);
        glVertex3fv(tab[i][j]);

        glNormal3fv(normal[i+1][j]);
        glTexCoord2f((i+1)/NF, j/NF);
        glVertex3fv(tab[i+1][j]);

        glNormal3fv(normal[i][j+1]);
        glTexCoord2f(i/NF, (j+1)/NF);
        glVertex3fv(tab[i][j+1]);

        glNormal3fv(normal[i][j+1]);
        glTexCoord2f(i/NF, (j+1)/NF);
        glVertex3fv(tab[i][j+1]);

        glNormal3fv(normal[i+1][j+1]);
        glTexCoord2f((i+1)/NF, (j+1)/NF);
        glVertex3fv(tab[i+1][j+1]);

        glNormal3fv(normal[i+1][j]);
        glTexCoord2f((i+1)/NF, j/NF);
        glVertex3fv(tab[i+1][j]);
    }
}

for(int i=N-1; i>N/2; i--){
    for(int j=0; j<N-1; j++){
        glNormal3fv(normal[i][j]);
        glTexCoord2f((N-i-1)/NF, (N-j)/NF);
        glVertex3fv(tab[i][j]);

        glNormal3fv(normal[i-1][j]);
        glTexCoord2f((N-i+1-1)/NF, (N-j)/NF);
        glVertex3fv(tab[i-1][j]);

        glNormal3fv(normal[i][j+1]);
        glTexCoord2f((N-i-1)/NF, (N-j-1)/NF);
        glVertex3fv(tab[i][j+1]);

        glNormal3fv(normal[i][j+1]);
        glTexCoord2f((N-i-1)/NF, (N-j-1)/NF);
        glVertex3fv(tab[i][j+1]);

        glNormal3fv(normal[i-1][j+1]);
        glTexCoord2f((N-i+1-1)/NF, (N-j-1)/NF);
        glVertex3fv(tab[i-1][j+1]);

        glNormal3fv(normal[i-1][j]);
        glTexCoord2f((N-i+1-1)/NF, (N-j)/NF);
        glVertex3fv(tab[i-1][j]);
    }
}
