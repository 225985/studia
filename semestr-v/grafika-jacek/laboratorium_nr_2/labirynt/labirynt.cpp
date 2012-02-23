#include "stdafx.h"
#include <windows.h>
#include <gl/GL.h>
#include <GL/glut.h>
#include <math.h>
#include <iostream>
#include <time.h>


float a = 150.0;
float w = 10.0;
int count = (int)a/w;


int randFun(int n){
	int k;
	if (n==1)
		return 1;
	do{
		k = rand() % n;
	}while(!k);
	return k;
}

void removeGate(float x, float y, int n, bool pos){
	int sz = randFun(n);
	glColor3f(0.0,0.0,0.0);
	glBegin(GL_LINES);
		if(pos){
			glVertex2f(x, y-(sz-1)*w);
			glVertex2f(x, y-sz*w);
		} else {
			glVertex2f(x + (sz-1)*w, y);
			glVertex2f(x + sz*w, y);
		}
	glEnd();

	glColor3f(1.0,1.0,1.0);

}

void drawMaze(float x, float y, int ver, int hor, int ch, int cv){
	
	int which = rand() % 4;
	
	glBegin(GL_LINES);
	glVertex2f(x , y - ver *w);
	glVertex2f(x + hor * w,y - ver *w);
	glEnd();	

	glBegin(GL_LINES);
	glVertex2f(x + hor * w , y - ver *w);
	glVertex2f(x + ch  * w,  y - ver *w);
	glEnd();

	glBegin(GL_LINES);
	glVertex2f(x + hor*w, y);
	glVertex2f(x + hor*w, y- ver*w);
	glEnd();

	glBegin(GL_LINES);
	glVertex2f(x + hor*w, y- ver*w);
	glVertex2f(x + hor*w, y- cv*w);
	glEnd();

	if(which == 0){
		removeGate(x+hor*w, y, ver, true);
		removeGate(x+hor*w, y-ver*w, ch - hor, false);
		removeGate(x+hor*w, y-ver*w, cv-ver, true);
	}else if(which == 1){
		removeGate(x+hor*w, y-ver*w, ch - hor, false);
		removeGate(x+hor*w, y-ver*w, cv-ver, true);
		removeGate(x, y-ver*w, hor, false);
	}else if(which == 2){
		removeGate(x+hor*w, y-ver*w, cv-ver, true);
		removeGate(x, y-ver*w, hor, false);
		removeGate(x+hor*w, y, ver, true);
	} else {
		removeGate(x, y-ver*w, hor, false);
		removeGate(x+hor*w, y, ver, true);
		removeGate(x+hor*w, y-ver*w, ch - hor, false);
	}
	
	int nh, nv;
	if(hor > 1 && ver > 1){
		nh = randFun(hor);
		nv = randFun(ver);
		drawMaze(x,y,nv,nh,hor,ver);
	}

	if(hor > 1 && (cv - ver) > 1){
		nh = randFun(hor);
		nv = randFun((cv - ver));
		drawMaze(x,y-ver*w,nv,nh,hor,(cv - ver));	
	}

	if((ch-hor) > 1 && ver > 1){
		nh = randFun((ch-hor));
		nv = randFun(ver);
		drawMaze(x + hor*w,y,nv,nh,(ch-hor),ver);
	}

	if((ch-hor) > 1 && (cv - ver) > 1){
		nh = randFun((ch-hor));
		nv = randFun((cv - ver));
		drawMaze(x + hor*w,y-ver*w,nv,nh,(ch-hor),(cv - ver));
	}

}

void RenderScene()
{
	
	glClear(GL_COLOR_BUFFER_BIT); // Czyszczenie okna aktualnym kolorem czyszcz¹cym
	
	glBegin(GL_LINES);
	glVertex2f(-a/2,a/2);
	glVertex2f(a/2,a/2);
	glEnd();
	glBegin(GL_LINES);
	glVertex2f(a/2,a/2);
	glVertex2f(a/2,-a/2);
	glEnd();
	glBegin(GL_LINES);
	glVertex2f(a/2,-a/2);
	glVertex2f(-a/2,-a/2);
	glEnd();
	glBegin(GL_LINES);
	glVertex2f(-a/2,-a/2);
	glVertex2f(-a/2,a/2);
	glEnd();

	int ver = randFun(count) ;
	int hor = randFun(count) ;

	drawMaze(-a/2, a/2, ver, hor, count, count);
	glFlush();

}



void MyInit(void)
{
   glClearColor(0.0f,0.0f,0.0f,0.0f); // Kolor okna wnêtrza okna - ustawiono na szary
}



void ChangeSize(GLsizei horizontal, GLsizei vertical)
{
    GLfloat AspectRatio; // Deklaracja zmiennej AspectRatio okreœlaj¹cej proporcjê wymiarów okna
    if(vertical==0) // Zabezpieczenie pzred dzieleniem przez 0
		vertical = 1;

    glViewport(0, 0, horizontal, vertical);// Ustawienie wielkoœciokna okna urz¹dzenia (Viewport)
    glMatrixMode(GL_PROJECTION); // Okreœlenie uk³adu wspó³rzêdnych obserwatora
	glLoadIdentity(); // Okreœlenie przestrzeni ograniczaj¹cej
	AspectRatio = (GLfloat)horizontal/(GLfloat)vertical; // Wyznaczenie wspó³czynnika proporcji okna

    if(horizontal <= vertical)
		glOrtho(-100.0,100.0,-100.0/AspectRatio,100.0/AspectRatio,1.0,-1.0);  
	else
		glOrtho(-100.0*AspectRatio,100.0*AspectRatio,-100.0,100.0,1.0,-1.0);
	
	glMatrixMode(GL_MODELVIEW);  
	glLoadIdentity(); 
}

int _tmain(int argc, _TCHAR* argv[])
{

	srand(time(NULL));

	
	
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA);
	glutInitWindowSize(1000, 800);
	glutCreateWindow("Drugi program w OpenGL");
	
	glutDisplayFunc(RenderScene);
	glutReshapeFunc(ChangeSize);
	MyInit();
	glutMainLoop();
	return 0;
}
