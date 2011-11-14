#include <iostream>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <stack>
#include <vector>

#include <GLUT/glut.h>
#include <OpenGL/OpenGL.h>

#define center(x,y) ((x+y)/2)


using namespace std;

typedef GLfloat * Color;
typedef GLfloat Point[2]; 


#define MAZE_SIZE 20
#define N 1
#define S 2
#define E 4
#define W 8
#define ALL (N | S | E | W)
int grid[MAZE_SIZE][MAZE_SIZE];

void draw();
void reshape(GLsizei, GLsizei);
void init();
void randomColor();
void triangleRec(GLfloat x, GLfloat y, GLfloat size, int n);
void _triangleRec(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2, GLfloat x3, GLfloat y3, int n);
void triangleRand(GLfloat x, GLfloat y, GLfloat size, int n);
void carpetRec(GLfloat x, GLfloat y, GLfloat size, int n, int p);
void _carpetRec(GLfloat x, GLfloat y, GLfloat size, int n, int p);
void maze();

int main (int argc, char ** argv){
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA);
    glutInitWindowSize(600, 600);
    glutCreateWindow("Zadanie");
    
    glutDisplayFunc(draw);
    glutReshapeFunc(reshape);
    
    init(); 
    srand((unsigned int)time(NULL));
    
    glutMainLoop();
    
    return 0;
}

void init(){
    glClearColor(0.0, 0.0, 0.0, 1.0);
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

void randomColor(){
    glColor3f(((rand() % 1001) / 1000.0), ((rand() % 1001) / 1000.0), ((rand() % 1001) / 1000.0));
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


void carpetRec(GLfloat x, GLfloat y, GLfloat size, int n, int p){
    GLfloat x1 = x-size/2;
    GLfloat y1 = y+size/2;
    _carpetRec(x1, y1, size, n, p);
}

GLfloat randp(){
    return ((rand() % 1000) - 500)/ 3000.0;
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


class Cell {
public:
    int x, y;
    Cell(int x, int y):x(x),y(y){}
    Cell():x(0),y(0){}
};

int maze_moves[4][2] = {
    {-1, 0},
    {0, -1},
    {0, 1},
    {1, 0}
};


void maze(GLfloat x, GLfloat y, GLfloat size){
    int s = size/MAZE_SIZE;
    x -= size/2;
    y -= size/2;
    
    for(int i=0; i<MAZE_SIZE; i++){
        for(int j=0; j<MAZE_SIZE; j++){
            grid[i][j] = N | S | E | W;
        }
    }
    
    
    stack<Cell *> stk;
    Cell found[4];
    int foundc = 0;
    int total = MAZE_SIZE*MAZE_SIZE;
    int visited = 1;
    Cell * current = new Cell(0,0);    
    
    while(visited < total){
        foundc = 0;
        for(int i=0; i<4; i++){
            int x1 = current->x + maze_moves[i][0];
            int y1 = current->y + maze_moves[i][1];
            
            if(x1 >= 0 && y1 >= 0 && x1 < MAZE_SIZE && y1 < MAZE_SIZE){
                if(grid[x1][y1] == ALL){
                    found[foundc].x = x1;
                    found[foundc].y = y1;
                    foundc++;
                }
            }
        }
                
        if(foundc > 0){
            Cell * c = &found[rand() % foundc];
            Cell * one = new Cell(c->x, c->y);
            if(one->x == current->x){
                if(one->y > current->y){
                    grid[one->x][one->y] &= ~N;
                    grid[current->x][current->y] &= ~S;
                } else {
                    grid[one->x][one->y] &= ~S;
                    grid[current->x][current->y] &= ~N;
                }
            } else {
                if(one->x > current->x){
                    grid[one->x][one->y] &= ~W;
                    grid[current->x][current->y] &= ~E;
                } else {
                    grid[one->x][one->y] &= ~E;
                    grid[current->x][current->y] &= ~W;
                }
            }
            
            stk.push(current);
            current = one;
            visited++;
        } else {
            current = stk.top();
            stk.pop();
        }
    }
    
    
    
    
    glColor3f(1.0f, 1.0f, 1.0f);
    for(int i=0; i<MAZE_SIZE; i++){
        for(int j=0; j<MAZE_SIZE; j++){
            glRectf(x+i*s, y+j*s, x+(i+1)*s, y+(j+1)*s);
        }
    }
    
    glColor3f(1.0f, 0.0f, 0.0f);
    glLineWidth(2.0f);
    
    for(int i=0; i<MAZE_SIZE; i++){
        for(int j=0; j<MAZE_SIZE; j++){
            
            if(grid[i][j] & N){
                glBegin(GL_LINES);
                glVertex2f(x+i*s, y+j*s);
                glVertex2f(x+(i+1)*s, y+j*s);
                glEnd();
            }
            
            if(grid[i][j] & S){
                glBegin(GL_LINES);
                glVertex2f(x+i*s, y+(j+1)*s);
                glVertex2f(x+(i+1)*s, y+(j+1)*s);
                glEnd();
            }
            
            if(grid[i][j] & E){
                glBegin(GL_LINES);
                glVertex2f(x+(i+1)*s, y+j*s);
                glVertex2f(x+(i+1)*s, y+(j+1)*s);
                glEnd();
            }
            
            if(grid[i][j] & W){
                glBegin(GL_LINES);
                glVertex2f(x+i*s, y+j*s);
                glVertex2f(x+i*s, y+(j+1)*s);
                glEnd();
            }
        }
    }
}




void draw(){
    glClear(GL_COLOR_BUFFER_BIT);
    
    //triangleRec(0, 0, 90, 7);
    //triangleRand(0, 0, 90, 100000);
    //carpetRec(0, 0, 180, 3, 5);
    maze(0, 0, 180);
    
    glFlush();
}



