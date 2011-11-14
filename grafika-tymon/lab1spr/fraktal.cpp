Color newColor3fv(Color c1, Color c2, GLfloat x){
    Color nc = new GLfloat[3];
    Color rc = randomColor3fv();

    for(int i=0; i<3; i++){
        nc[i] = ((1 - 2*W(x)) * rc[i]) + (W(x) * c1[i]) + (W(x) * c2[i]);
    }
    delete[] rc;
    return nc;
}

Color newCenterColor3fv(Color c1, Color c2, Color c3, Color c4, GLfloat x){
    Color nc = new GLfloat[3];
    Color rc = randomColor3fv();

    for(int i=0; i<3; i++){
        nc[i] = (1 - 4*Wc(x)) * rc[i] + (Wc(x)*c1[i] + Wc(x)*c2[i] + Wc(x)*c3[i] + Wc(x)*c4[i]);
    }

    delete[] rc;
    return nc;
}


void drawSquare(GLfloat x, GLfloat y, GLfloat size, Color c1, Color c2, Color c3, Color c4){
    if(size < .1f) return;

    GLfloat a = size / 2;

    Color c12 = newColor3fv(c1, c2, a);
    Color c13 = newColor3fv(c1, c3, a);
    Color c24 = newColor3fv(c2, c4, a);
    Color c34 = newColor3fv(c3, c4, a);
    Color cc = newCenterColor3fv(c1, c2, c3, c4, a);

    glColor3fv(c12);
    glVertex2f(x+a, y);

    glColor3fv(c13);
    glVertex2f(x, y-a);

    glColor3fv(cc);
    glVertex2f(x+a, y-a);

    glColor3fv(c24);
    glVertex2f(x+size, y-a);

    glColor3fv(c34);
    glVertex2f(x+a, y-size);

    drawSquare(x,   y,   a, c1, c12, c13, cc);
    drawSquare(x+a, y,   a, c12, c2, cc, c24);
    drawSquare(x,   y-a, a, c13, cc, c3, c34);
    drawSquare(x+a, y-a, a, cc, c24, c34, c4);

}
