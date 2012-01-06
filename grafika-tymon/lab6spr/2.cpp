// Funkcja rysujaca teksturowana piramide

void piramid(){
    if(show[0]){
        glBegin(GL_QUADS);
        glTexCoord2f(0.0, 1.0);
        glVertex3f(-3.0,  3.0, 0.0); // D
        glTexCoord2f(1.0, 1.0);
        glVertex3f( 3.0,  3.0, 0.0); // C
        glTexCoord2f(1.0, 0.0);
        glVertex3f( 3.0, -3.0, 0.0); // B
        glTexCoord2f(0.0, 0.0);
        glVertex3f(-3.0, -3.0, 0.0); // A
        glEnd();
    }

    glBegin(GL_TRIANGLES);

    if(show[1]){
        glTexCoord2f(0.0, 0.0);
        glVertex3f(-3.0, -3.0, 0.0); // A
        glTexCoord2f(1.0, 0.0);
        glVertex3f( 3.0, -3.0, 0.0); // B
        glTexCoord2f(0.5, 0.5);
        glVertex3f( 0.0,  0.0, 5.0);
    }

    if(show[2]){
        glTexCoord2f(1.0, 0.0);
        glVertex3f( 3.0, -3.0, 0.0); // B
        glTexCoord2f(1.0, 1.0);
        glVertex3f( 3.0,  3.0, 0.0); // C
        glTexCoord2f(0.5, 0.5);
        glVertex3f( 0.0,  0.0, 5.0);
    }

    if(show[3]){
        glTexCoord2f(1.0, 1.0);
        glVertex3f( 3.0,  3.0, 0.0); // C
        glTexCoord2f(0.0, 1.0);
        glVertex3f(-3.0,  3.0, 0.0); // D
        glTexCoord2f(0.5, 0.5);
        glVertex3f( 0.0,  0.0, 5.0);
    }

    if(show[4]){
        glTexCoord2f(0.0, 1.0);
        glVertex3f(-3.0,  3.0, 0.0); // D
        glTexCoord2f(0.0, 0.0);
        glVertex3f(-3.0, -3.0, 0.0); // A
        glTexCoord2f(0.5, 0.5);
        glVertex3f( 0.0,  0.0, 5.0);
    }

    glEnd();

}
