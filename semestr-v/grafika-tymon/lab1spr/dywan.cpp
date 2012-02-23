void carpetRec(GLfloat x, GLfloat y, GLfloat size, int n, int p){
    GLfloat x1 = x-size/2;
    GLfloat y1 = y+size/2;
    _carpetRec(x1, y1, size, n, p);
}

void _carpetRec(GLfloat x, GLfloat y, GLfloat size, int n, int p){
    if(n == 0) return;

    GLfloat a = size/3;

    glBegin(GL_QUADS);
    glColor3f(0.0, 0.0, 0.0);
    glVertex2f(x+a,   y-a);
    glVertex2f(x+a+a, y-a);
    glVertex2f(x+a+a, y-a-a);
    glVertex2f(x+a,   y-a-a);
    glEnd();


    if(n == 1){
        for(int i=-1; i<=1; i++){
            for(int j=-1; j<=1; j++){
                if(!(i == 0 && j == 0)){
                    GLfloat xm = x+i*a + p*randp();
                    GLfloat ym = y+j*a + p*randp();

                    glBegin(GL_POLYGON);
                    randomColor();
                    glVertex2f(xm+a,   ym-a);
                    randomColor();
                    glVertex2f(xm+a+a, ym-a);
                    randomColor();
                    glVertex2f(xm+a+a, ym-a-a);
                    randomColor();
                    glVertex2f(xm+a,   ym-a-a);
                    glEnd();
                }
            }
        }
    }


    n -= 1;
    _carpetRec(x,     y,     a, n, p);
    _carpetRec(x+a,   y,     a, n, p);
    _carpetRec(x+a+a, y,     a, n, p);
    _carpetRec(x,     y-a,   a, n, p);
    _carpetRec(x+a+a, y-a,   a, n, p);
    _carpetRec(x,     y-a-a, a, n, p);
    _carpetRec(x+a,   y-a-a, a, n, p);
    _carpetRec(x+a+a, y-a-a, a, n, p);
}
