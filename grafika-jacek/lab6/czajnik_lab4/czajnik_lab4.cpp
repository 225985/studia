// jajko.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <windows.h>
#include <gl/GL.h>
#include <GL/glut.h>
#include <math.h>
#include <time.h>

#define PI 3.14159265
typedef float point3[3];
const int N = 25;
float tab[N][N][3];
float col[N][N][3];

int model = 3;
//static GLfloat theta[] = {0.0, 0.0, 0.0}; // trzy k¹ty obrotu
static GLfloat viewer[]= {0.0, 0.0, 10.0}; 

static GLfloat thetax = 0.0;
static GLfloat thetay = 0.0;
static GLfloat theta_zoom = 0.0;// k?t obrotu obiektu
static GLfloat pix2angle;     // przelicznik pikseli na stopnie

static GLint status = 0;      // stan klawiszy myszy
                              // 0 - nie naci?ni?to ?adnego klawisza
                              // 1 - naci?ni?ty zosta? lewy klawisz

static int x_pos_old=0;       // poprzednia pozycja kursora myszy
static int y_pos_old=0;
static int zoom = 0;

static int delta_x = 0;       // ró?nica pomi?dzy pozycj? bie??c?
static int delta_y = 0;                             // i poprzedni? kursora myszy
static int delta_zoom = 0;

void Axes(void)
{

    point3  x_min = {-5.0, 0.0, 0.0};
    point3  x_max = { 5.0, 0.0, 0.0};
    // poczatek i koniec obrazu osi x

    point3  y_min = {0.0, -5.0, 0.0};
    point3  y_max = {0.0,  5.0, 0.0};
    // poczatek i koniec obrazu osi y

    point3  z_min = {0.0, 0.0, -5.0};
    point3  z_max = {0.0, 0.0,  5.0};
    //  poczatek i koniec obrazu osi y

    glColor3f(1.0f, 0.0f, 0.0f);  // kolor rysowania osi - czerwony
    glBegin(GL_LINES); // rysowanie osi x

        glVertex3fv(x_min);
        glVertex3fv(x_max);

    glEnd();

    glColor3f(0.0f, 1.0f, 0.0f);  // kolor rysowania - zielony
    glBegin(GL_LINES);  // rysowanie osi y

        glVertex3fv(y_min);
        glVertex3fv(y_max);                            

    glEnd();

    glColor3f(0.0f, 0.0f, 1.0f);  // kolor rysowania - niebieski
    glBegin(GL_LINES); // rysowanie osi z

        glVertex3fv(z_min);
        glVertex3fv(z_max); 

    glEnd();

}
void ChangeSize(GLsizei horizontal, GLsizei vertical )
{
	pix2angle = 360.0/(float)horizontal;
     glMatrixMode(GL_PROJECTION);
    // Prze??czenie macierzy bie??cej na macierz projekcji

    glLoadIdentity();
    // Czyszcznie macierzy bie??cej

    gluPerspective(70.0, 1.0, 1.0, 30.0);
    // Ustawienie parametrów dla rzutu perspektywicznego


    if(horizontal <= vertical)
        glViewport(0, (vertical-horizontal)/2, horizontal, horizontal);

    else
        glViewport((horizontal-vertical)/2, 0, vertical, vertical);
    // Ustawienie wielko?ci okna okna widoku (viewport) w zale?no?ci
    // relacji pomi?dzy wysoko?ci? i szeroko?ci? okna

    glMatrixMode(GL_MODELVIEW);
    // Prze??czenie macierzy bie??cej na macierz widoku modelu  

    glLoadIdentity();
    // Czyszczenie macierzy bie??cej 
}



void RenderScene(void)
{


    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glutReshapeFunc(ChangeSize);
    glLoadIdentity();
	gluLookAt(viewer[0],viewer[1],viewer[2], 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
    Axes();
	//glRotatef(theta[0], 1.0, 0.0, 0.0);
	//glRotatef(theta[1], 0.0, 1.0, 0.0);
	//glRotatef(theta[2], 0.0, 0.0, 1.0);
	//glColor3f(1.0f, 1.0f, 1.0f); // Ustawienie koloru rysowania na bia³y 
	//glRotated(60.0, 1.0, 1.0,1.0);
	if(status == 1)                    // je?li lewy klawisz myszy wci?ni?ty
	{
	   thetax += delta_x * pix2angle;
	   thetay += delta_y * pix2angle;
	   
	}  else if(status ==2){
		theta_zoom += delta_zoom*pix2angle;
		
	}// do ró?nicy po?o?e? kursora myszy

	glRotatef(thetax, 0.0, 1.0, 0.0);
	glRotatef(thetay, 1.0, 0.0, 0.0);
	glRotatef(theta_zoom, 0.0, 0.0, 0.0);
	glColor3f(1.0f, 1.0f, 1.0f);
// Ustawienie koloru rysowania na bia?y

glutWireTeapot(3.0);
// Narysowanie czajnika 
	
	glFlush();
    glutSwapBuffers();
}




void Mouse(int btn, int state, int x, int y)
{


    if(btn==GLUT_LEFT_BUTTON && state == GLUT_DOWN)       
    {
        x_pos_old = x;        // przypisanie aktualnie odczytanej pozycji kursora
        y_pos_old = y;                    // jako pozycji poprzedniej
        status = 1;         // wci?ni?ty zosta? lewy klawisz myszy
    }
	else if(btn==GLUT_RIGHT_BUTTON && state == GLUT_DOWN){
		zoom = y;
		status = 2;
	}
	else
        status = 0;         // nie zosta? wci?ni?ty ?aden klawisz
}

void Motion( GLsizei x, GLsizei y )
{
   
    delta_x= x - x_pos_old;    // obliczenie ró?nicy po?o?enia kursora myszy
	x_pos_old = x;
	delta_y = y - y_pos_old;
	y_pos_old = y;
	delta_zoom = y - zoom;
                // podstawienie bie?acego po?o?enia jako poprzednie
	
	zoom = y;
    glutPostRedisplay();    // przerysowanie obrazu sceny
}



void MyInit(void)
{
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
}




int _tmain(int argc, _TCHAR* argv[])
{

	srand(time(NULL));

	
	
	
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB |GLUT_DEPTH);
    glutInitWindowSize(800, 800);
	
    glutCreateWindow("jajko");
    glutDisplayFunc(RenderScene);
	glutReshapeFunc(ChangeSize);

	glutMouseFunc(Mouse);
// Ustala funkcj? zwrotn? odpowiedzialn? za badanie stanu myszy
   
glutMotionFunc(Motion);
// Ustala funkcj? zwrotn? odpowiedzialn? za badanie ruchu myszy
	//glutIdleFunc(spinEgg);
    MyInit();
    glEnable(GL_DEPTH_TEST);
    glutMainLoop();
   
}

