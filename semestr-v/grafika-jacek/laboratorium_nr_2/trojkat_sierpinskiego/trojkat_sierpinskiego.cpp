#include "stdafx.h"
#include <windows.h>
#include <gl/GL.h>
#include <GL/glut.h>
#include <math.h>
#include <iostream>
#include <time.h>

typedef float colorTab[3];
typedef float point[2];

int st = 0;
int per = 0;
float a1, c1, a2, c2, a3, c3;
float at = 150.0f;
float x_1, y_1, x_2, y_2, x_3, y_3;
int which = 0;

void randColor(colorTab c)
{
	for(int i=0; i<3; i++)
	{
		c[i] = (float)rand()/(float)RAND_MAX;
	}
}

void drawTriangle(float a, float ax, float ay, int st)
{
	float h = a * sqrt(3.0) / 2.0;
	float ax2 = rand() % 1 ? ax + (float)rand()/(float)RAND_MAX*per : ax - (float)rand()/(float)RAND_MAX*per;
	float ay2 = rand() % 1 ? ay + (float)rand()/(float)RAND_MAX*per : ay - (float)rand()/(float)RAND_MAX*per; 
	colorTab c;

	if(st == 0)
	{
		
		glBegin(GL_TRIANGLES);
			randColor(c);
			glColor3fv(c);
			glVertex2f(ax2,ay2);

			randColor(c);
			glColor3fv(c);
			glVertex2f(ax2 - a/2, ay - h);

			randColor(c);
			glColor3fv(c);
			glVertex2f(ax + a/2, ay2 - h);
		glEnd();
	} else {
		drawTriangle(a/2, ax,ay, st-1);
		drawTriangle(a/2, ax-a/4, ay - h/2, st-1);
		drawTriangle(a/2, ax+a/4, ay - h/2, st-1);
	}
}


int getOrientationResult(float x1, float y1, float x2, float y2, float px, float py) {
    float orientation = ((x2 - x1) * (py - y1)) - ((px - x1) * (y2 - y1));
    if (orientation > 0) {
        return 1;
    }
    else if (orientation < 0) {
        return -1;
    }
    else {
        return 0;
    }
}

bool isInside(float px, float py){
	float o1 = getOrientationResult(x_1, y_1, x_2, y_2, px, py);
    float o2 = getOrientationResult(x_2, y_2, x_3, y_3, px, py);
    float o3 = getOrientationResult(x_3, y_3, x_1, y_1, px, py);

    return (o1 == o2) && (o2 == o3);
}

void ChaosTriangle(){
	float x = 0.0, y = 0.0;
	int t;
	colorTab c;
	x_1 = 0.0f;
	y_1 = at * sqrt(3.0f) / 3.0f;

	x_2 = -at/2;
	y_2 = -at * sqrt(3.0f) / 6.0f;

	x_3 = at/2;
	y_3 = -at * sqrt(3.0f) / 6.0f;


	do{
		x = (((float)rand()/(float)RAND_MAX) * at) - at * 0.5;
		y = (((float)rand()/(float)RAND_MAX) * at*sqrt(3.0)* 0.5) - (at*sqrt(3.0)/6);
	}while(!isInside(x,y));
	for(int i=0; i<100000; i++){
		t = rand() % 3;
		if(t==0){
			x = (x_1 + x) * 0.5;
			y = (y_1 + y) * 0.5; 
		}else if(t==1){
			x = (x_2 + x) * 0.5;
			y = (y_2 + y) * 0.5;
		} else {
			x = (x_3 + x) * 0.5;
			y = (y_3 + y) * 0.5;
		}

		glBegin(GL_POINTS);
			randColor(c);
			glColor3fv(c);
			glVertex2f(x, y);
		glEnd();
	}
}




void RenderScene()
{
	glClear(GL_COLOR_BUFFER_BIT); // Czyszczenie okna aktualnym kolorem czyszcz¹cym

	if(!which){
		glColor3f(1.0f, 0.0f, 0.0f);
		drawTriangle(150.0f,0.0f,150.0f * sqrt(3.0) / 3.0, st); 
	} else {
		ChaosTriangle();
	}
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

	std::cout << "0 - zwykly, 1 - chaos : ";
	std::cin >> which;
	if(!which)
	{
		std::cout << "Podaj perturbacje (0 - 10) \n";
		std::cin >> per;
	
		while(per < 0 || per > 10)
		{
			std::cout << "Bledny zakres\n";
			std::cin >> per;
		}
	
		std::cout << "Podaj stopien\n";
		std::cin >> st;
		while(st < 0)
		{
			std::cout << "Bledny zakres\n";
			std::cin >> st;
		}
	}
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA);
	glutInitWindowSize(1000, 800);
	glutCreateWindow("Drugi program w OpenGL");
	
	glutDisplayFunc(RenderScene);
	glutReshapeFunc(ChangeSize);
	MyInit();
	glutMainLoop();
	return 0;
}
