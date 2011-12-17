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
int which = 1;
float tab[N][N][3];
float col[N][N][3];
float nor[N][N][3];
static GLfloat theta[] = {0.0, 0.0, 0.0};
GLfloat light_pos[2][4] ={{0.0,0.0,10.0,1.0},{1.0,1.0,1.0,0.0}};
GLfloat beta[2][2] = {{0.0,0.0},{0.0,0.0}};
int model = 3;
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

   // glColor3f(1.0f, 0.0f, 0.0f);  // kolor rysowania osi - czerwony
    glBegin(GL_LINES); // rysowanie osi x

        glVertex3fv(x_min);
        glVertex3fv(x_max);

    glEnd();

   // glColor3f(0.0f, 1.0f, 0.0f);  // kolor rysowania - zielony
    glBegin(GL_LINES);  // rysowanie osi y

        glVertex3fv(y_min);
        glVertex3fv(y_max);                            

    glEnd();

   // glColor3f(0.0f, 0.0f, 1.0f);  // kolor rysowania - niebieski
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
			//glColor3fv(col[i][j]);
			glNormal3fv(nor[i][j]);
			glVertex3fv(tab[i][j]);
				
				
			//glColor3fv(col[i+1][j]);
			glNormal3fv(nor[i+1][j]);
			glVertex3fv(tab[i+1][j]);
				
				
			//glColor3fv(col[i][j+1]);
			glNormal3fv(nor[i][j+1]);
			glVertex3fv(tab[i][j+1]);
			glEnd();

			glBegin(GL_TRIANGLES);
			//glColor3fv(col[i+1][j+1]);
			glNormal3fv(nor[i+1][j+1]);
			glTexCoord2f(0.5f, 1.0f);
			glVertex3fv(tab[i+1][j+1]);
				
				
			//glColor3fv(col[i+1][j]);
			glNormal3fv(nor[i+1][j]);
			glTexCoord2f(1.0f, 0.0f);
			glVertex3fv(tab[i+1][j]);
				
				
			//glColor3fv(col[i][j+1]);
			glNormal3fv(nor[i][j+1]);
			glTexCoord2f(0.0f, 0.0f);
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
	
	gluLookAt(viewer[0],viewer[1],viewer[2], 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);

	Axes();
	
	
	

	if(which ==1) {
		glRotatef(theta[0], 1.0, 0.0, 0.0);

		glRotatef(theta[1], 0.0, 1.0, 0.0);

		glRotatef(theta[2], 0.0, 0.0, 1.0);
	} else if(model == 2) {
		if(status == 1)                    // je?li lewy klawisz myszy wci?ni?ty
		{
		   beta[0][0] += delta_x * pix2angle / 30.0;
		   beta[0][1] += delta_y * pix2angle / 30.0;
	   
		}  else if(status ==2){
			beta[1][0] += delta_x * pix2angle / 30.0;
			beta[1][1] += delta_y * pix2angle / 30.0;
		}
	

		for(int b=0; b<2; b++){
                       
            light_pos[b][0] = theta_zoom *cos(beta[b][0])*cos(beta[b][1]);
            light_pos[b][1] = theta_zoom *sin(beta[b][1]);
            light_pos[b][2] = theta_zoom *sin(beta[b][0])*cos(beta[b][1]);
        }

        
        glLightfv(GL_LIGHT0, GL_POSITION, light_pos[0]);
        glLightfv(GL_LIGHT1, GL_POSITION, light_pos[1]);
	
	

	if(model == 1)
		EggsPoints();
	else if(model == 2)
		EggsMesh();
	else
		EggsTriangles();
		//glutSolidTeapot(3.0);
	} else {
	glBegin(GL_TRIANGLE_FAN);     	// draw triangle
      glColor3f(1.0f,0.0f,0.0f);                	// set color to red
      glVertex3f(  0.0f,  30.0f, 0.0f);
      glColor3f(0.0f,1.0f,0.0f);                	// set color to green
      glVertex3f(-50.0f, -50.0f, 50.0f);
      glColor3f(1.0f,1.0f,0.0f);                	// set color to yellow
      glVertex3f( 50.0f, -50.0f, 50.0f);
      glColor3f(0.0f,0.0f,1.0f);                	// set color to blue
      glVertex3f( 50.0f, -50.0f, -50.0f);
      glColor3f(1.0f,1.0f,1.0f);                	// set color to white
      glVertex3f( -50.0f, -50.0f, -50.0f);
      glColor3f(0.0f,1.0f,0.0f);                	// set color to green
      glVertex3f(-50.0f, -50.0f, 50.0f);
   glEnd();
   glBegin(GL_QUADS);                           	// draw square
      glColor3f(0.0f,1.0f,0.0f);                	// set color to green
      glVertex3f(-50.0f, -50.0f, 50.0f);
      glColor3f(1.0f,1.0f,1.0f);                	// set color to white
      glVertex3f( -50.0f, -50.0f, -50.0f);
      glColor3f(0.0f,0.0f,1.0f);                	// set color to blue
      glVertex3f( 50.0f, -50.0f, -50.0f);
      glColor3f(1.0f,1.0f,0.0f);                	// set color to yellow
      glVertex3f( 50.0f, -50.0f, 50.0f);
   glEnd();
	}
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

void spinEgg()
{

    theta[0] -= 0.1;
    if( theta[0] > 360.0 ) theta[0] -= 360.0;

    theta[1] -= 0.1;
    if( theta[1] > 360.0 ) theta[1] -= 360.0;

    theta[2] -= 0.1;
    if( theta[2] > 360.0 ) theta[2] -= 360.0;

    glutPostRedisplay(); //odœwie¿enie zawartoœci aktualnego okna
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
		x_pos_old = x;        // przypisanie aktualnie odczytanej pozycji kursora
        y_pos_old = y;                    // jako pozycji poprzedniej
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
	
    glutPostRedisplay();    // przerysowanie obrazu sceny
}



void MyInit(void)
{
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);

    
    GLfloat mat_ambient[]  = {1.0, 1.0, 1.0, 1.0};        
    GLfloat mat_diffuse[]  = {0.8, 0.8, 0.8, 1.0};    
    GLfloat mat_specular[] = {0.8, 0.8, 0.8, 1.0};    
    GLfloat mat_shininess  = {50.0};

      
    GLfloat light0_ambient[] = {0.0, 0.0, 0.0, 1.0};
    GLfloat light0_diffuse[] = {1.0, 1.0, 0.2, 1.0};        
    GLfloat light0_specular[]= {1.0, 1.0, 0.2, 1.0}; 

    

    GLfloat att_constant  = {1.0};
    GLfloat att_linear    = {0.05}; 
    GLfloat att_quadratic  = {0.001};

    
    glMaterialfv(GL_FRONT, GL_SPECULAR, mat_specular);
    glMaterialfv(GL_FRONT, GL_AMBIENT, mat_ambient);
    glMaterialfv(GL_FRONT, GL_DIFFUSE, mat_diffuse);
    glMaterialf(GL_FRONT, GL_SHININESS, mat_shininess);

    
    glLightfv(GL_LIGHT0, GL_AMBIENT, light0_ambient);
    glLightfv(GL_LIGHT0, GL_DIFFUSE, light0_diffuse);
    glLightfv(GL_LIGHT0, GL_SPECULAR, light0_specular);
    glLightfv(GL_LIGHT0, GL_POSITION, light_pos[0]);

    
    glLightfv(GL_LIGHT1, GL_AMBIENT, light1_ambient);
    glLightfv(GL_LIGHT1, GL_DIFFUSE, light1_diffuse);
    glLightfv(GL_LIGHT1, GL_SPECULAR, light1_specular);
    glLightfv(GL_LIGHT1, GL_POSITION, light_pos[1]);

    
    glLightf(GL_LIGHT0, GL_CONSTANT_ATTENUATION, att_constant);
    glLightf(GL_LIGHT0, GL_LINEAR_ATTENUATION, att_linear);
    glLightf(GL_LIGHT0, GL_QUADRATIC_ATTENUATION, att_quadratic);

    
    glLightf(GL_LIGHT1, GL_CONSTANT_ATTENUATION, att_constant);
    glLightf(GL_LIGHT1, GL_LINEAR_ATTENUATION, att_linear);
    glLightf(GL_LIGHT1, GL_QUADRATIC_ATTENUATION, att_quadratic);

    
    glShadeModel(GL_SMOOTH); // w³aczenie ³agodnego cieniowania
    glEnable(GL_LIGHTING);   // w³aczenie systemu oœwietlenia sceny 
    glEnable(GL_LIGHT0);     // w³¹czenie Ÿród³a o numerze 0
    glEnable(GL_LIGHT1);     // w³¹czenie Ÿród³a o numerze 1
    glEnable(GL_DEPTH_TEST); // w³¹czenie mechanizmu z-bufora 
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
	
	//std::cin >> which;
	which = 2;
	float u = 0.0, v=0.0;
    float xu, xv, yu, yv, zu, zv;

	for(int i=0; i< N; i++)
	{
		for(int j=0; j<N; j++)
		{
			u = (float)i/(N-1);
            v = (float)j/(N-1);
			tab[i][j][0] =(-90 * pow(u,5.0f) + 225*pow(u,4.0f) - 270*pow(u,3.0f)+180*pow(u,2.0f)-45*u)*cos(PI * v) ;
			tab[i][j][1] = 160*pow(u,4.0f) - 320*pow(u,3.0f)+160*pow(u,2.0f) - 5.0;
			tab[i][j][2] = (-90 * pow(u,5.0f) + 225*pow(u,4.0f) - 270*pow(u,3.0f)+180*pow(u,2.0f)-45*u)*sin(PI * v);
			
			xu = (-450*pow(u,4) + 900*pow(u,3) - 810*pow(u,2) + 360*u - 45)*cos(PI * v);
			yu = 640*pow(u,3) - 960*pow(u,2) + 320*u;
			zu = (-450*pow(u,4) + 900*pow(u,3) - 810*pow(u,2) + 360*u - 45)*sin(PI * v);

			xv = PI * (90*pow(u,5) - 225*pow(u,4) + 270*pow(u,3) - 180*pow(u,2) + 45*u)*sin(PI * v);
			yv = 0;
			zv =  -PI * (90*pow(u,5) - 225*pow(u,4) + 270*pow(u,3) - 180*pow(u,2) + 45*u)*cos(PI * v);
			
			nor[i][j][0] = (yu * zv - zu * yv);
			nor[i][j][1] = (zu * xv - xu * zv);
			nor[i][j][2] = (xu * yv - yu * xv);

			float len = sqrt(pow(nor[i][j][0],2) + pow(nor[i][j][1],2) + pow(nor[i][j][2],2));
			for(int k=0; k<3; k++)
				nor[i][j][k] /= len;
		}

	}

	for(int i=N/2; i<N;i++)
		for(int j=0; j<N; j++)
			for(int k=0; k<3; k++)
				nor[i][j][k] *= -1;
	//randCol();
	
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB |GLUT_DEPTH);
    glutInitWindowSize(800, 800);
	
    glutCreateWindow("jajko");
    glutDisplayFunc(RenderScene);
	glutReshapeFunc(ChangeSize);
	glutKeyboardFunc(keys);

	if(which == 2) 
	{
		glutMouseFunc(Mouse);
		glutMotionFunc(Motion);
	}
	else 
	{
		glutIdleFunc(spinEgg);
	}
	MyInit();
    glEnable(GL_DEPTH_TEST);
    glutMainLoop();
   
}

