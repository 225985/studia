#include "stdafx.h"
#include <windows.h>
#include <gl/GL.h>
#include <GL/glut.h>
#include <math.h>
#include <iostream>
#include <time.h>

typedef float colorTab[3];
typedef float point[2];

float a = 150.0;
int n = 1500;
float roz = a/n;

int which;
float pa, pb;

float randColor()
{
	return 1.0 * ((rand() % 100) + 100) / 255;
}

void randColorTab(colorTab c){
	for(int i=0; i<3; i++){
		c[i] = (float)rand()/(float)RAND_MAX;
	}
}


void drawPoint(float x, float y, float c){
	glBegin(GL_POINTS);
	glColor3f(c, c, c);
	glVertex2f(x,y);
	glEnd();
}

void drawPoint(float x, float y, colorTab c){
	glBegin(GL_POINTS);
	glColor3fv(c);
	glVertex2f(x,y);
	glEnd();
}

float getHalf(float x){

	float w = 1000* sin(0.005 * x) / (10*x);
	return w;
}

float getCenter(float x){
	float w = 1000* sin(0.003 * x) / (10*x);
	return w;
}


void drawPoints(float x, float y, float a, int corner, float c1, float c2, float c3, float c4 ){
	
	float c12 = randColor(), c13 = randColor(), c24 = randColor(), c34 = randColor(), cc = randColor();
	float col;
	

	c12 = (1-2*getHalf(a/2))*c12 + getHalf(a/2) * (c1 + c2); 
	c13= (1-2*getHalf(a/2))*c13 + getHalf(a/2) * (c1 + c3); 
	c24 = (1-2*getHalf(a/2))*c24 + getHalf(a/2) * (c4 + c2); 
	c34 = (1-2*getHalf(a/2))*c34 + getHalf(a/2) * (c3 + c4); 
	cc = (1-4*getCenter(a/2))*cc + getCenter(a/2) * (c1 + c2 + c3 + c4); 
	
	if(corner == 1){
		drawPoint(x + a/2, y, c12);
		drawPoint(x, y-a/2, c13);
		drawPoint(x + a/2, y - a/2, cc);
		drawPoint(x + a, y - a/2, c24);
	} else if(corner == 2){
		drawPoint(x + a/2, y, c12);
		drawPoint(x + a/2, y - a/2, cc);
		drawPoint(x + a, y - a/2, c24);
		drawPoint(x + a/2, y - a, c34);
	} else if(corner == 3){
		drawPoint(x + a/2, y, c12);
		drawPoint(x, y-a/2, c13);
		drawPoint(x + a/2, y - a/2, cc);
		drawPoint(x + a/2, y - a, c34);
	} else if(corner == 4){
		drawPoint(x, y-a/2, c13);
		drawPoint(x + a/2, y - a/2, cc);
		drawPoint(x + a, y - a/2, c24);
		drawPoint(x + a/2, y - a, c34);
	} else {
		drawPoint(x + a/2, y, c12);
		drawPoint(x, y-a/2, c13);
		drawPoint(x + a/2, y - a/2, cc);
		drawPoint(x + a, y - a/2, c24);
		drawPoint(x + a/2, y - a, c34);
	}

	if(a > roz){
		drawPoints(x,y,a/2, 1, c1, c12, c13, cc);
		drawPoints(x+a/2,y,a/2, 2, c12, c2, cc, c24);
		drawPoints(x, y-a/2, a/2, 3, c13, cc, c3, c34);
		drawPoints(x+a/2, y - a/2,  a/2,4, cc, c24, c34, c4);
	}
}

void drawPoints(float x, float y, float a, int corner, colorTab c_1, colorTab c_2, colorTab c_3, colorTab c_4 ){
	
	colorTab c12, c13, c24, c34, cc;
	float col;
	
	randColorTab(c12);
	for(int i=0; i<3; i++)
		c12[i] = (1-2*getHalf(a/2))*c12[i] + getHalf(a/2) * (c_1[i] + c_2[i]); 
	randColorTab(c13);
	for(int i=0; i<3; i++)
		c13[i] = (1-2*getHalf(a/2))*c13[i] + getHalf(a/2) * (c_1[i] + c_3[i]); 
	randColorTab(c24);
	for(int i=0; i<3; i++)
		c24[i] = (1-2*getHalf(a/2))*c24[i] + getHalf(a/2) * (c_2[i] + c_4[i]); 
	randColorTab(c34);
	for(int i=0; i<3; i++)
		c34[i] = (1-2*getHalf(a/2))*c34[i] + getHalf(a/2) * (c_3[i] + c_4[i]); 
	randColorTab(cc);
	for(int i=0; i<3; i++)
		cc[i] = (1-4*getCenter(a/2))*cc[i] + getCenter(a/2) * (c_1[i] + c_2[i] + c_3[i] + c_4[i]); 
	
	if(corner == 1){
		drawPoint(x + a/2, y, c12);
		drawPoint(x, y-a/2, c13);
		drawPoint(x + a/2, y - a/2, cc);
		drawPoint(x + a, y - a/2, c24);
	} else if(corner == 2){
		drawPoint(x + a/2, y, c12);
		drawPoint(x + a/2, y - a/2, cc);
		drawPoint(x + a, y - a/2, c24);
		drawPoint(x + a/2, y - a, c34);
	} else if(corner == 3){
		drawPoint(x + a/2, y, c12);
		drawPoint(x, y-a/2, c13);
		drawPoint(x + a/2, y - a/2, cc);
		drawPoint(x + a/2, y - a, c34);
	} else if(corner == 4){
		drawPoint(x, y-a/2, c13);
		drawPoint(x + a/2, y - a/2, cc);
		drawPoint(x + a, y - a/2, c24);
		drawPoint(x + a/2, y - a, c34);
	} else {
		drawPoint(x + a/2, y, c12);
		drawPoint(x, y-a/2, c13);
		drawPoint(x + a/2, y - a/2, cc);
		drawPoint(x + a, y - a/2, c24);
		drawPoint(x + a/2, y - a, c34);
	}

	if(a > roz){
		drawPoints(x,y,a/2, 1, c_1, c12, c13, cc);
		drawPoints(x+a/2,y,a/2, 2, c12, c_2, cc, c24);
		drawPoints(x, y-a/2, a/2, 3, c13, cc, c_3, c34);
		drawPoints(x+a/2, y - a/2,  a/2,4, cc, c24, c34, c_4);
	}
}




void RenderScene()
{
	
	glClear(GL_COLOR_BUFFER_BIT); // Czyszczenie okna aktualnym kolorem czyszcz¹cym
	
	if(!which){
	colorTab c1, c2, c3, c4;

	randColorTab(c1);
	randColorTab(c2);
	randColorTab(c3);
	randColorTab(c4);

	drawPoint(-a/2,a/2, c1);
	drawPoint(a/2,a/2, c2);
	drawPoint(-a/2,-a/2, c4);
	drawPoint(a/2,-a/2, c3);
	
	drawPoints(-a/2,a/2,a, 5, c1, c2, c3, c4);
	} else {
		float c1 = randColor(), c2 = randColor(), c3 = randColor(), c4 = randColor();	
		drawPoint(-a/2,a/2, c1);
		drawPoint(a/2,a/2, c2);
		drawPoint(-a/2,-a/2, c4);
		drawPoint(a/2,-a/2, c3);
	
		drawPoints(-a/2,a/2,a, 5, c1, c2, c3, c4);
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

	std::cout << " 0 - kolorowy, 1 - monochromatyczny\n";
	std::cin >> which;
	std::cout << "Funkcja losuj¹ca 1000* sin(0.005 * x) / (10*x)\n ";
	std::cout << "podaj parametr pa funkcji W(x) (0.001 - 0.01) \n";
	std::cin >> pa;
	std::cout << "podaj parametr pb funkcji Wc(x) (0.001 - 0.01) \n";
	std::cin >> pb;
	std::cout << "podaj n (ilosc pkt w na szeroskosc) \n";
	std::cin >> n;
	std::cout << "podaj a (szerokosc fraktala) \n";
	std::cin >> a;

	roz = a/n;
	
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA);
	glutInitWindowSize(1000, 800);
	glutCreateWindow("Drugi program w OpenGL");
	
	glutDisplayFunc(RenderScene);
	glutReshapeFunc(ChangeSize);
	MyInit();
	glutMainLoop();
	return 0;
}
