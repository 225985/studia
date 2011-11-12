#include <iostream>
#include <stdlib.h>
#include <math.h>
#include <GLUT/glut.h>
#include <OpenGL/OpenGL.h>

#define N 40
#define M_POINTS 1
#define M_MESH   2
#define M_FILLED 3

using namespace std;

typedef float p3[3];

float tab[N][N][3];
float color[N][N][3];

int model = M_MESH;
static GLfloat theta[] = {0.0, 0.0, 0.0};

void draw();
void reshape(GLsizei, GLsizei);
void keys(unsigned char, int, int);
void init();
void axes();
void calc();
void egg();
void fillRandomColors();
void spinEgg();


int main (int argc, char ** argv){
    calc();
    fillRandomColors();
    
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
    glutInitWindowSize(300, 300);
    glutCreateWindow("Lab 3");
    
    glutDisplayFunc(draw);
    glutReshapeFunc(reshape);
    glutKeyboardFunc(keys);
    glutIdleFunc(spinEgg);
    
    fillRandomColors();
    init();
    calc();
    
    glEnable(GL_DEPTH_TEST);

    glutMainLoop();
    
    return 0;
}


void axes(){
    p3 x_min = {-5.0, 0.0, 0.0};
    p3 x_max = { 5.0, 0.0, 0.0};
    
    p3 y_min = {0.0, -5.0, 0.0};
    p3 y_max = {0.0,  5.0, 0.0};
    
    p3 z_min = {0.0, 0.0, -5.0};
    p3 z_max = {0.0, 0.0,  5.0};
    
    glColor3f(1.0, 0.0, 0.0);
    glBegin(GL_LINES);
    glVertex3fv(x_min);
    glVertex3fv(x_max);
    glEnd();
    
    glColor3f(0.0, 1.0, 0.0);
    glBegin(GL_LINES);
    glVertex3fv(y_min);
    glVertex3fv(y_max);
    glEnd();
    
    glColor3f(0.0, 0.0, 1.0);
    glBegin(GL_LINES);
    glVertex3fv(z_min);
    glVertex3fv(z_max);
    glEnd();
}

void fillRandomColors(){
    for(int i=0; i<N; i++){
        for(int j=0; j<N; j++){
            for(int k=0; k<3; k++){
                color[i][j][k] = (rand() % 101)/100.0f;
            }
        }
    }
}

void spinEgg(){
    theta[0] += 0.05;
    if(theta[0] > 360.0) theta[0] -= 360.0;
    
    theta[1] += 0.15;
    if(theta[1] > 360.0) theta[1] -= 360.0;
    
    theta[2] += 0.05;
    if(theta[2] > 360.0) theta[2] -= 360.0;
    
    glutPostRedisplay();
}

void calc(){
    // calc
    float u = 0.0, v=0.0;
    
	for(int i=0; i< N; i++){
        u = ((float)i)/(N-1);
		for(int j=0; j<N; j++){
            v = ((float)j)/(N-1);
			tab[i][j][0] = (-90*pow(u, 5.0) + 225*pow(u, 4.0) - 270*pow(u, 3.0) + 180*pow(u, 2.0) - 45*u) * cos(3.14 * v) ;
			tab[i][j][1] =  160*pow(u, 4.0) - 320*pow(u, 3.0) + 160*pow(u, 2.0) - 5.0;
			tab[i][j][2] = (-90*pow(u, 5.0) + 225*pow(u, 4.0) - 270*pow(u, 3.0) + 180*pow(u, 2.0) - 45*u) * sin(3.14 * v);
		}
        
	}
}

void egg(){
    // draw
    switch(model){
        case M_POINTS:
            glColor3f(1.0, 1.0, 1.0);
            glBegin(GL_POINTS);
            
            for(int i=0; i<N; i++){
                for(int j=0; j<N; j++){
                    glVertex3fv(tab[i][j]);
                }
            }
            
            glEnd();
            break;
            
        case M_MESH:
            glColor3f(1.0, 1.0, 1.0);
            glBegin(GL_LINES);
            
            int i1,j1;
            
            for(int i=0; i<N; i++){
                for(int j=0; j<N; j++){
                    i1 = (i+1) == N ? 0 : i+1;
                    j1 = (j+1) == N ? 0 : j+1;
                                        
                    glVertex3fv(tab[i][j]);
                    glVertex3fv(tab[i1][j]);
                    
                    glVertex3fv(tab[i][j]);
                    glVertex3fv(tab[i][j1]);
                }
            }
            glEnd();
            
            
            break;
            
        case M_FILLED:
            glColor3f(1.0, 1.0, 1.0);
            glBegin(GL_TRIANGLES);
            
            
            for(int i=0; i<N; i++){
                for(int j=0; j<N; j++){
                    i1 = (i+1) == N ? 0 : i+1;
                    j1 = (j+1) == N ? 0 : j+1;
                    
                    glColor3fv(color[i][j]);
                    glVertex3fv(tab[i][j]);
                    
                    glColor3fv(color[i1][j]);
                    glVertex3fv(tab[i1][j]);
                    
                    glColor3fv(color[i][j1]);
                    glVertex3fv(tab[i][j1]);
                    
                    glColor3fv(color[i1][j1]);
                    glVertex3fv(tab[i1][j1]);
                    
                    glColor3fv(color[i1][j]);
                    glVertex3fv(tab[i1][j]);
                    
                    glColor3fv(color[i][j1]);
                    glVertex3fv(tab[i][j1]);
                }
            }
            
            glEnd();
            break;
    }
    
}

void init(){
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
}


void reshape(GLsizei horizontal, GLsizei vertical){
    GLfloat ratio;
    
    if(vertical == 0) vertical = 1;
    
    glViewport(0, 0, horizontal, vertical);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    
    ratio = (GLfloat)horizontal/(GLfloat)vertical;
    
    if(horizontal <= vertical) {
        glOrtho(-7.5, 7.5, -7.5/ratio, 7.5/ratio, 10.0, -10.0);
    } else {
        glOrtho(-7.5*ratio, 7.5*ratio, -7.5, 7.5, 10.0, -10.0);
    }
    
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}

void keys(unsigned char key, int x, int y){
    if(key == 'p') model = M_POINTS;
    if(key == 'w') model = M_MESH;
    if(key == 's') model = M_FILLED;
    
    draw();
}

void draw(){
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glLoadIdentity();
    
    glTranslatef(0.0, 0.0, 0);
    
    axes();
    
    glRotatef(theta[0], 1.0, 0.0, 0.0);
    glRotatef(theta[1], 0.0, 1.0, 0.0);
    glRotatef(theta[2], 0.0, 0.0, 1.0);
    
    egg();
    
    glFlush();
    glutSwapBuffers();
}
