#include <iostream>
#include <stdlib.h>
#include <math.h>
#include <GLUT/glut.h>
#include <OpenGL/OpenGL.h>

#define W(x) (1000* sin(0.005 * x) / (10*x))

#define Wc(x) (1000* sin(0.003 * x) / (10*x))

using namespace std;

typedef GLfloat * Color;
typedef GLfloat Point[2]; 

void draw();
void reshape(GLsizei, GLsizei);
void init();
GLfloat * randomColor3fv();
Color newColor3fv(Color c1, Color c2, GLfloat x);
Color newCenterColor3fv(Color c1, Color c2, Color c3, Color c4, GLfloat x);

int main (int argc, char ** argv){
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA);
    glutInitWindowSize(300, 300);
    glutCreateWindow("Zadanie 2.1");
    
    glutDisplayFunc(draw);
    glutReshapeFunc(reshape);
    
    init(); 
    
    glutMainLoop();
    
    return 0;
}

void init(){
    glClearColor(0.5f, 0.5f, 0.5f, 1.0f);
}


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

void reshape(GLsizei horizontal, GLsizei vertical){    
    GLfloat ratio;
    
    if(vertical == 0) vertical = 1;
    
    glViewport(0, 0, horizontal, vertical);     
    glMatrixMode(GL_PROJECTION); 
    glLoadIdentity();
    
    ratio = (GLfloat)horizontal/(GLfloat)vertical;
    
    if(horizontal <= vertical) {
        glOrtho(-100.0, 100.0, -100.0/ratio, 100.0/ratio, 1.0, -1.0);
    } else { 
        glOrtho(-100.0*ratio, 100.0*ratio, -100.0, 100.0, 1.0, -1.0);
    }
    
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}

void drawSquare(GLfloat x, GLfloat y, GLfloat size, Color c1, Color c2, Color c3, Color c4){
    if(size < 1.5f) return;

    cout << x << " x " << y << " | " << size << endl;
    
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

void draw(){
    glClear(GL_COLOR_BUFFER_BIT);  
    
    GLfloat coords[4][2] = {
        { -100.0f,  100.0f },
        {  100.0f,  100.0f },
        { -100.0f, -100.0f },
        {  100.0f, -100.0f }
    };
    Color * colors = new Color[4];
    

    glBegin(GL_POINTS);
    
    for(int i=0; i<4; i++) {
        colors[i] = randomColor3fv();
        glColor3fv(colors[i]);
        glVertex2f(coords[i][0], coords[i][1]);
    }
    
    drawSquare(coords[0][0], coords[0][1], 200.0f, colors[0], colors[1], colors[2], colors[3]);
    
    
    glEnd();

    
    glFlush();
}

Color randomColor3fv(){
    Color v = new GLfloat[3];
//    v[0] = v[1] = v[2] = (rand() % 101) / 100.0;
    
    v[0] = (rand() % 101) / 100.0;
    v[1] = (rand() % 101) / 100.0;
    v[2] = (rand() % 101) / 100.0;
    return v;
}


