#include <iostream>
#include <stdlib.h>
#include <math.h>
#include <GLUT/glut.h>
#include <OpenGL/OpenGL.h>

#define N 20
#define M_POINTS 1
#define M_MESH   2
#define M_FILLED 3

float abs_f(float x){
   return  x > 0 ? x : -x;
}

using namespace std;

typedef float p3[3];

float tab[N][N][3];
float color[N][N][3];
bool spin = false;

int model = M_MESH;
static GLfloat theta[] = {0.0, 0.0, 0.0};
static GLfloat beta[] = {0.0, 0.0, 0.0};
static GLfloat r=10.0;
static GLfloat pix2angle;
static GLfloat status = 0;
static int x_pos_old = 0;
static int delta_x = 0;
static int y_pos_old = 0;
static int delta_y = 0;
static GLfloat zoom_pos_old = 0.0;
static GLfloat delta_zoom = 0.0;
static GLfloat viewer[] = {0.0, 0.0, 10.0};
static int yp = 1;

void draw();
void reshape(GLsizei, GLsizei);
void keys(unsigned char, int, int);
void mouse(int btn, int state, int x, int y);
void motion(GLsizei x, GLsizei y);
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
    glutInitWindowSize(600, 600);
    glutCreateWindow("Rzutowanie perspektywiczne");
    
    glutDisplayFunc(draw);
    glutReshapeFunc(reshape);
    glutKeyboardFunc(keys);
    glutMouseFunc(mouse);
    glutMotionFunc(motion);
    //glutIdleFunc(spinEgg);
    
    //fillRandomColors();
    init();
    //calc();
    
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
    
    for(int i=0; i<N; i++){
        for(int k=0; k<3; k++){
            color[i][N-1][k] = color[N-i-1][0][k];
        }
    }
}

void spinEgg(){
//    if(spin){
//        theta[0] += 0.05;
//        if(theta[0] > 360.0) theta[0] -= 360.0;
//        
//        theta[1] += 0.15;
//        if(theta[1] > 360.0) theta[1] -= 360.0;
//        
//        theta[2] += 0.05;
//        if(theta[2] > 360.0) theta[2] -= 360.0;
//        
//        glutPostRedisplay();
//    }
}

void calc(){
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
                        
            for(int i=0; i<N-1; i++){
                for(int j=0; j<N-1; j++){
                    glVertex3fv(tab[i][j]);
                    glVertex3fv(tab[i+1][j]);
                    
                    glVertex3fv(tab[i][j]);
                    glVertex3fv(tab[i][j+1]);
                }
            }
    
            glEnd();
            
            
            break;
            
        case M_FILLED:
            glColor3f(1.0, 1.0, 1.0);
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
            break;
    }
    
}

void init(){
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
}

void mouse(int btn, int state, int x, int y){
    if(btn == GLUT_LEFT_BUTTON){
        if(state == GLUT_DOWN){
            x_pos_old = x;
            y_pos_old = y;
            status = 1;
        } else {
            status = 0;
        }
    } else if(btn == GLUT_RIGHT_BUTTON){
        if(state == GLUT_DOWN){
            zoom_pos_old = y;
            status = 2;
        } else {
            status = 0;
        }
    }
}

void motion(GLsizei x, GLsizei y){
    delta_x = x - x_pos_old;
    x_pos_old = x;
    
    delta_y = y - y_pos_old;
    y_pos_old = y;
    
    delta_zoom = y - zoom_pos_old;
    zoom_pos_old = y;
    
    glutPostRedisplay();
}

void reshape(GLsizei horizontal, GLsizei vertical){
    pix2angle = 360.0/(float)horizontal;
    
    glViewport(0, 0, horizontal, vertical);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
        
    gluPerspective(70, 1.0, 1.0, 30.0);
    
    if(horizontal <= vertical) {
        glViewport(0, (vertical-horizontal)/2, horizontal, horizontal);
    } else {
        glViewport((horizontal-vertical)/2, 0, vertical, vertical);
    }
    
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}

void keys(unsigned char key, int x, int y){
    switch(key){
        case 'p':
            model = M_POINTS;
            break;
            
        case 'm':
            model = M_MESH;
            break;
            
        case 'f':
            model = M_FILLED;
            break;
            
        case 's':
            spin = !spin;
            break;
            
//        case '1':
//            theta[0] += 3;
//            break;
//            
//        case '2':
//            theta[1] += 3;
//            break;
//            
//        case '3':
//            theta[2] += 3;
//            break;
    }
    
    draw();
}

void draw(){
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glLoadIdentity();
    
    bool zad1 = true;
    
    if(zad1){
        if(status == 1){
            theta[1] += delta_x*pix2angle;
            theta[0] += delta_y*pix2angle;
        } else if(status == 2){
            viewer[2] += delta_zoom/10.0;
            if(viewer[2] < 0) viewer[2] = 0;
        }
    } else {
        if(status == 1){
            beta[0] += delta_x/40.0;
            beta[1] += delta_y/40.0;
        } else if(status == 2){
            r += delta_zoom/10.0;
        }
                
        if(beta[1] >= M_PI) beta[1] -= 2*M_PI;
        else if(beta[1] <= -M_PI) beta[1] += 2*M_PI;
    
        if(beta[1] > M_PI/2 || beta[1] < -M_PI/2) yp = -1;
        else yp = 1;
        
        viewer[0] = r*cos(beta[0])*cos(beta[1]);
        viewer[1] = r*sin(beta[1]);
        viewer[2] = r*sin(beta[0])*cos(beta[1]);
        
        cout << beta[0] << " : " << beta[1] << endl;
        cout << viewer[0] << " : " << viewer[1] << " : " << viewer[2] << endl;
    }
    
    gluLookAt(viewer[0], viewer[1], viewer[2], 0.0, 0.0, 0.0, 0.0, yp, 0.0);

    axes();
    
    if(zad1){
        glRotatef(theta[0], 1.0, 0.0, 0.0);
        glRotatef(theta[1], 0.0, 1.0, 0.0);
        glRotatef(theta[2], 0.0, 0.0, 1.0);
    }
    
    if(!zad1){
        glColor3f(1.0, 1.0, 1.0);
        glutWireTeapot(3.0);
    } else {
        egg();
    }
    
    glFlush();
    glutSwapBuffers();
}
