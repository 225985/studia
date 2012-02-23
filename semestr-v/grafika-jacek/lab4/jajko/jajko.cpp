// jajko.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <windows.h>
#include <gl/GL.h>
#include <GL/glut.h>
#include <math.h>
#include <time.h>
#include <iostream>
#define PI 3.14159265
typedef float point3[3];
const int N = 25;
float tab[N][N][3];
float col[N][N][3];

int model = 2;
//static GLfloat theta[] = {0.0, 0.0, 0.0}; // trzy k¹ty obrotu
static GLfloat viewer[]= {0.0, 0.0, 10.0}; 

static GLfloat p = 1.0;

static GLfloat thetax = 0.0;
static GLfloat thetay = 0.0;
static GLfloat theta_zoom = 10.0;// k?t obrotu obiektu
static GLfloat pix2angle;     // przelicznik pikseli na stopnie

static GLint status = 0;      // stan klawiszy myszy
                              // 0 - nie naci?ni?to ?adnego klawisza
                              // 1 - naci?ni?ty zosta? lewy klawisz

static int x_pos_old=0;       // poprzednia pozycja kursora myszy
static int y_pos_old=0;
static int zoom = 0;

static int delta_x = 0;       // ró?nica pomi?dzy pozycj? bie??c?
static int delta_y = 0;                             // i poprzedni? kursora myszy
static int delta_zoom = 0;     // ró?nica pomi?dzy pozycj? bie??c?
                              // i poprzedni? kursora myszy


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




void EggsPoints(){
		
	glColor3f(1.0f, 1.0f, 1.0f);
	glBegin(GL_POINTS);
	for(int k=0; k<N; k++)
	{
		for(int l=0; l<N; l++)
		{
			glVertex3f(tab[k][l][0],tab[k][l][1],tab[k][l][2]);
		}
	}
	glEnd();
	
}

void EggsMesh(){
	
	glColor3f(1.0f, 1.0f, 1.0f);
	
	glBegin(GL_LINES);
	for(int i=0; i<N-1; i++){
        for(int j=0; j<N-1; j++)
		{
			glVertex3fv(tab[i][j]);
			glVertex3fv(tab[i+1][j]);

			glVertex3fv(tab[i+1][j+1]);
			glVertex3fv(tab[i+1][j]);
		}
    }
	glEnd();
}

void EggsTriangles(){
	

	glBegin(GL_TRIANGLES);
	for(int i=0; i<N-1; i++){
        for(int j=0; j<N-1; j++)
		{
			glBegin(GL_TRIANGLES);
			glColor3fv(col[i][j]);
			glVertex3fv(tab[i][j]);
				
				
			glColor3fv(col[i+1][j]);
			glVertex3fv(tab[i+1][j]);
				
				
			glColor3fv(col[i][j+1]);
			glVertex3fv(tab[i][j+1]);
			glEnd();

			glBegin(GL_TRIANGLES);
			glColor3fv(col[i+1][j+1]);
			glVertex3fv(tab[i+1][j+1]);
				
				
			glColor3fv(col[i+1][j]);
			glVertex3fv(tab[i+1][j]);
				
				
			glColor3fv(col[i][j+1]);
			glVertex3fv(tab[i][j+1]);
			glEnd();
		}
    }
	glEnd();
	
}

void randCol(){
    for(int i=0; i<N; i++){
        for(int j=0; j<N; j++){
            for(int k=0; k<3; k++){
                col[i][j][k] = (float)rand()/(float)RAND_MAX;
            }
        }
    }
    
    for(int i=0; i<N; i++){
        for(int k=0; k<3; k++){
            col[i][N-1][k] = col[N-i-1][0][k];
        }
    }
}


void RenderScene(void)
{


    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glLoadIdentity();
	gluLookAt(viewer[0],viewer[1],viewer[2], 0.0, 0.0, 0.0, 0.0, p, 0.0);
    Axes();
	if(status == 1)                    // je?li lewy klawisz myszy wci?ni?ty
	{
	   thetax += delta_x * pix2angle / 30.0;
	   thetay += delta_y * pix2angle / 30.0;
	   
	}  else if(status ==2){
		theta_zoom += delta_zoom/10.0;
		
	}
	std::cout << thetax << " " << thetay << "\n";

	if(thetay > 3.1415) thetay -= 2*3.1415;
        else if(thetay <= -3.1415) thetay += 2*3.1415;


	if(thetay > 3.1415/2 || thetay < -3.1415/2){
		p = -1.0;
		
	} else{
		p = 1.0;
		
	}
	

	viewer[0] = theta_zoom*cos(thetax)*cos(thetay);
	viewer[1] = theta_zoom*sin(thetay);
	viewer[2] = theta_zoom*sin(thetax)*cos(thetay);

	

	if(model == 1)
		EggsPoints();
	else if(model == 2)
		EggsMesh();
	else
		EggsTriangles();
	
	glFlush();
    glutSwapBuffers();
}

void keys(unsigned char key, int x, int y)
{
    if(key == 'p') model = 1;
    if(key == 'w') model = 2;
    if(key == 's') model = 3;
   
    RenderScene(); // przerysowanie obrazu sceny
}

//void spinEgg()
//{
//
//    theta[0] -= 0.1;
//    if( theta[0] > 360.0 ) theta[0] -= 360.0;
//
//    theta[1] -= 0.1;
//    if( theta[1] > 360.0 ) theta[1] -= 360.0;
//
//    theta[2] -= 0.1;
//    if( theta[2] > 360.0 ) theta[2] -= 360.0;
//
//    glutPostRedisplay(); //odœwie¿enie zawartoœci aktualnego okna
//}

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
        status = 0;         // nie zosta? wci?ni?ty ?aden klawisz       // nie zosta? wci?ni?ty ?aden klawisz
}

void Motion( GLsizei x, GLsizei y )
{
   
   delta_x= x - x_pos_old;    // obliczenie ró?nicy po?o?enia kursora myszy
	x_pos_old = x;
	delta_y = y - y_pos_old;
	y_pos_old = y;
	delta_zoom = y - zoom;
    zoom = y;

    glutPostRedisplay();    // przerysowanie obrazu sceny
}



void MyInit(void)
{
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
}

void ChangeSize(GLsizei horizontal, GLsizei vertical )
{
	pix2angle = 360.0/(float)horizontal;
     glMatrixMode(GL_PROJECTION);
    // Prze??czenie macierzy bie??cej na macierz projekcji

    glLoadIdentity();
    // Czyszcznie macierzy bie??cej

    gluPerspective(100.0, 1.0, 1.0, 30.0);
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


int _tmain(int argc, _TCHAR* argv[])
{

	srand(time(NULL));

	float u = 0.0, v=0.0;
    
	for(int i=0; i< N; i++)
	{
		for(int j=0; j<N; j++)
		{
			u = (float)i/(N-1);
            v = (float)j/(N-1);
			tab[i][j][0] =(-90 * pow(u,5.0f) + 225*pow(u,4.0f) - 270*pow(u,3.0f)+180*pow(u,2.0f)-45*u)*cos(PI * v) ;
			tab[i][j][1] = 160*pow(u,4.0f) - 320*pow(u,3.0f)+160*pow(u,2.0f) - 5.0;
			tab[i][j][2] = (-90 * pow(u,5.0f) + 225*pow(u,4.0f) - 270*pow(u,3.0f)+180*pow(u,2.0f)-45*u)*sin(PI * v);
		   
		}

	}
	randCol();
	
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB |GLUT_DEPTH);
    glutInitWindowSize(800, 800);
	
    glutCreateWindow("jajko");
    glutDisplayFunc(RenderScene);
	glutReshapeFunc(ChangeSize);
	glutKeyboardFunc(keys);
	glutMouseFunc(Mouse);
// Ustala funkcj? zwrotn? odpowiedzialn? za badanie stanu myszy
   
glutMotionFunc(Motion);
// Ustala funkcj? zwrotn? odpowiedzialn? za badanie ruchu myszy
	//glutIdleFunc(spinEgg);
    MyInit();
    glEnable(GL_DEPTH_TEST);
    glutMainLoop();
   
}

