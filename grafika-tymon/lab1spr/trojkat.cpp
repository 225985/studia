void triangleRec(GLfloat x, GLfloat y, GLfloat size, int n){
    GLfloat sq = sqrtf(3);
    GLfloat x1 = -sq/2;
    GLfloat y1 = -1.0f/2;
    GLfloat x2 = sq/2;
    GLfloat y2 = -1.0f/2;
    GLfloat x3 = 0;
    GLfloat y3 = 1;

    randomColor();
    glBegin(GL_TRIANGLES);
    glVertex2f(x+x1*size, y+y1*size);
    glVertex2f(x+x2*size, y+y2*size);
    glVertex2f(x+x3*size, y+y3*size);
    glEnd();

    _triangleRec(x+x1*size, y+y1*size, x+x2*size, y+y2*size, x+x3*size, y+y3*size, n);
}

void _triangleRec(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2, GLfloat x3, GLfloat y3, int n){
    if(n == 0) return;

    GLfloat x12 = center(x1, x2);
    GLfloat y12 = center(y1, y2);
    GLfloat x23 = center(x2, x3);
    GLfloat y23 = center(y2, y3);
    GLfloat x31 = center(x3, x1);
    GLfloat y31 = center(y3, y1);

    glColor3f(0.0, 0.0, 0.0);
    glBegin(GL_TRIANGLES);
    glVertex2f(x12, y12);
    glVertex2f(x23, y23);
    glVertex2f(x31, y31);
    glEnd();

    n -= 1;
    _triangleRec(x1, y1, x12, y12, x31, y31, n);
    _triangleRec(x12, y12, x2, y2, x23, y23, n);
    _triangleRec(x31, y31, x23, y23, x3, y3, n);
}


void triangleRand(GLfloat x, GLfloat y, GLfloat size, int n){
    GLfloat sq = sqrtf(3);

    randomColor();
    glBegin(GL_POINTS);

    GLfloat xp = 0, yp = 0;

    for(int i=0; i<n; i++){
        int r = rand() % 3;
        switch(r){
            case 0:
                xp = xp/2;
                yp = yp/2 + 0.5f;
                break;
            case 1:
                xp = xp/2 - sq/4;
                yp = yp/2 - 0.25f;
                break;
            case 2:
                xp = xp/2 + sq/4;
                yp = yp/2 - 0.25f;
                break;
        }

        glVertex2f(x+xp*size, y+yp*size);
    }

    glEnd();
}
