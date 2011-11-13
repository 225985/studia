

#include "stdafx.h"
#include <windows.h>
#include <gl/GL.h>
#include <GL/glut.h>
#include <math.h>
#include <iostream>
#include <time.h>

typedef float colorTab[3];

int st = 0;
int per = 0;
bool which = false;


void randColor(colorTab c)
{
	for(int i=0; i<3; i++)
	{
		c[i] = (float)rand()/(float)RAND_MAX;
	}
}


void DrawRect(float a, float ax, float ay)
{
	int count = which ? (2*st+1) : (2*st+1) * 5;
	float x = a/count;
	colorTab c;
	
	for(int i=0; i<count; i++)
	{
		for(int j=0; j<count; j++)
		{
			float ax2 = rand() % 1 ? ax + (float)rand()/(float)RAND_MAX*per : ax - (float)rand()/(float)RAND_MAX*per;
			float ay2 = rand() % 1 ? ay + (float)rand()/(float)RAND_MAX*per : ay - (float)rand()/(float)RAND_MAX*per;
			glBegin(GL_POLYGON);
				randColor(c);
				glColor3fv(c);
				glVertex2f(ax2 + j*x , ay2 - i*x);

				randColor(c);
				glColor3fv(c);
				glVertex2f(ax2 + j*x, ay2 - (i +1)*x );

				randColor(c);
				glColor3fv(c);
				glVertex2f(ax2 + (j+1)*x, ay2 - (i +1)*x );

				randColor(c);
				glColor3fv(c);
				glVertex2f(ax2 + (j+1)*x, ay2 - i*x );
			glEnd();	
		}
	}
	
}


void DrawOneSierp(float a, float ax, float ay, int st){
	
	glPushMatrix();
	
	if(st == 0){
		DrawRect(a,ax,ay);
	} else {
		float x = a/3;
		for(int i=0; i<3; i++)
		{
			for(int j=0; j<3; j++)
			{
				if(3*i + j != 4)
				{
					DrawOneSierp(x, ax + j*x, ay - i*x, st-1);		
				}
			}
		}
	}
	
	glPopMatrix();
}


int powr(int x){
	if(!x)
		return 1;
	else
		return powr(x-1)*3;
}

void DrawBlack(float a, float ax, float ay)
{
	
	glColor3f(0.0f, 0.0f, 0.0f);
	
		
			glBegin(GL_POLYGON);
				glVertex2f(ax,ay);

				glVertex2f(ax, ay - a);

				glVertex2f(ax +a, ay -a);

				glVertex2f(ax + a, ay );
			glEnd();	
	
	
}

void DrawBlackPer(float a, float ax, float ay, int b)
{
glColor3f(0.0f, 0.0f, 0.0f);
	
		
	int count = (2*st+1)*5;
	float x = 180.0/count;
	
	
	for(int i=0; i<count; i++)
	{
		for(int j=0; j<count; j++)
		{
			float ax2 = rand() % 1 ? ax + (float)rand()/(float)RAND_MAX*per : ax - (float)rand()/(float)RAND_MAX*per;
			float ay2 = rand() % 1 ? ay + (float)rand()/(float)RAND_MAX*per : ay - (float)rand()/(float)RAND_MAX*per;
			glBegin(GL_POLYGON);
				
				glVertex2f(ax2 + j*x , ay2 - i*x);

				glVertex2f(ax2 + j*x, ay2 - (i +1)*x );

				glVertex2f(ax2 + (j+1)*x, ay2 - (i +1)*x );

				glVertex2f(ax2 + (j+1)*x, ay2 - i*x );
			glEnd();	
		}
	}
}


void DrawSierpIt(float a, float ax, float ay, int st)
{	
	DrawRect(a,ax,ay);
	for(int i=0; i<st; i++)
	{

		int pow = powr(i);
		float x = a/(1.0*(pow));

		for(int j=0; j<pow; j++)
		{
			for(int k=0; k<pow; k++)
			{
				float na = a/(3*pow);
				float nx = ax + (k * x) + (a/(3*pow));
				float ny = ay - ((j * x) + (a/(3*pow)));
				DrawBlack(na, nx, ny);
			}
		}
		
	}
}


void RenderScene()
{
	glClear(GL_COLOR_BUFFER_BIT); // Czyszczenie okna aktualnym kolorem czyszcz¹cym

	glColor3f(0.0f, 1.0f, 0.0f);
    // Ustawienie aktualnego koloru rysowania na zielony

	float a = 180.0f;
	
	if(which)
		DrawOneSierp(a,-a/2,a/2,st);
	else
		DrawSierpIt(a,-a/2,a/2,st);
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
	srand((unsigned)time(0));

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

	while(which > 1 || which < 0)
	{
		std::cout << "Bledny zakres\n";
		std::cin >> which;
	}

	std::cout << "0. Iteracyjnie, 1. Rekurencyjnie \n";
	std::cin >> which;

	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA);
	glutInitWindowSize(1000, 600);
	glutCreateWindow("Drugi program w OpenGL");
	
	glutDisplayFunc(RenderScene);
	glutReshapeFunc(ChangeSize);
	MyInit();
	glutMainLoop();
	return 0;
}


