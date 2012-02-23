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

int model = 3;
static GLfloat theta[] = {0.0, 0.0, 0.0}; // trzy k¹ty obrotu

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
	int N = 50;
	float tab[200][200][3];
	
	float u = 0.0, v=0.0;
    
	for(int i=0; i< N; i++)
	{
		for(int j=0; j<N; j++)
		{
			u = (float)i/(N-1);
            v = (float)j/(N-1);
		   tab[i][j][0] =(-90 * pow(u,5.0f) + 225*pow(u,4.0f) - 270*pow(u,3.0f)+180*pow(u,2.0f)-45*u)*cos(PI * v) ;
		   tab[i][j][1] = 160*pow(u,4.0f) - 320*pow(u,3.0f)+160*pow(u,2.0f);
		   tab[i][j][2] = (-90 * pow(u,5.0f) + 225*pow(u,4.0f) - 270*pow(u,3.0f)+180*pow(u,2.0f)-45*u)*sin(PI * v);
		   
		}

	}
	
	
	glColor3f(1.0f, 1.0f, 1.0f);
	glBegin(GL_POINTS);
	for(int k=0; k<N; k++)
	{
		for(int l=0; l<N; l++)
		{
			glVertex3f(tab[k][l][0],tab[k][l][1] - 5.0,tab[k][l][2]);
			
		}
	}
	glEnd();
	
}

void EggsMesh(){
	int N = 50;
	float tab[200][200][3];
	
	float u = 0.0, v=0.0;
    
	for(int i=0; i<N; ++i)
        for(int j = 0; j<N; ++j)
        {
            u = (float)i/(N-1);
            v = (float)j/(N-1);
            tab[i][j][0] = (-90*pow(u, 5)+225*pow(u, 4)-270*pow(u, 3)+180*pow(u, 2)-45*u)*cos(3.14*v);
            tab[i][j][1] = 160*pow(u, 4)-320*pow(u, 3)+160*pow(u, 2)-5.0;
            tab[i][j][2] = (-90*pow(u, 5)+225*pow(u, 4)-270*pow(u, 3)+180*pow(u, 2)-45*u)*sin(3.14*v);
        }
	
	
	glColor3f(1.0f, 1.0f, 1.0f);
	
	glBegin(GL_LINES);
	for(int i=0; i<N-1; ++i){
        for(int j=0; j<N-1; ++j)
		
		{
			glVertex3fv(tab[i][j]);
			glVertex3fv(tab[i+1][j]);

			glVertex3fv(tab[i][j]);
			glVertex3fv(tab[i][j+1]);

			glVertex3fv(tab[i+1][j]);
			glVertex3fv(tab[i][j+1]);
		}
    }
	glEnd();
}

void EggsTriangles(){
	int N = 50;
	float tab[200][200][3];
	float col[200][200][3];

	float u = 0.0, v=0.0;
    
	for(int i=0; i<N; ++i)
        for(int j = 0; j<N; ++j)
        {
            u = (float)i/(N-1);
            v = (float)j/(N-1);
            tab[i][j][0] = (-90*pow(u, 5)+225*pow(u, 4)-270*pow(u, 3)+180*pow(u, 2)-45*u)*cos(3.14*v);
            tab[i][j][1] = 160*pow(u, 4)-320*pow(u, 3)+160*pow(u, 2)-5.0;
            tab[i][j][2] = (-90*pow(u, 5)+225*pow(u, 4)-270*pow(u, 3)+180*pow(u, 2)-45*u)*sin(3.14*v);
			col[i][j][0] = (float)rand()/(float)RAND_MAX;
			col[i][j][1] = (float)rand()/(float)RAND_MAX;
			col[i][j][2] = (float)rand()/(float)RAND_MAX;
        }
	
	int ic, jc;

	glBegin(GL_TRIANGLES);
	for(int i=0; i<N-1; i++){
        for(int j=0; j<N-1; j++)
		{
			glColor3f(1.0,1.0,1.0);

			
			glBegin(GL_TRIANGLES);


				glColor3fv(col[i][j]);
				glVertex3fv(tab[i][j]);
				
				glColor3fv(col[i+1][j]);
				glVertex3fv(tab[i+1][j]);
				

				glColor3fv(col[i][j+1]);
				glVertex3fv(tab[i][j+1]);
			glEnd();

			glColor3f(1.0,1.0,1.0);
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




void RenderScene(void)
{

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glLoadIdentity();
    Axes();
	glRotatef(theta[0], 1.0, 0.0, 0.0);
	glRotatef(theta[1], 0.0, 1.0, 0.0);
	glRotatef(theta[2], 0.0, 0.0, 1.0);
	glColor3f(1.0f, 1.0f, 1.0f); // Ustawienie koloru rysowania na bia³y 
	glRotated(90.0, 0.0, 1.0,0.0);
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

void MyInit(void)
{
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
}

void ChangeSize(GLsizei horizontal, GLsizei vertical )
{

    GLfloat AspectRatio;
    if(vertical == 0)  // Zabezpieczenie przed dzieleniem przez 0

        vertical = 1;
	glViewport(0, 0, horizontal, vertical);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    AspectRatio = (GLfloat)horizontal/(GLfloat)vertical;
    /*if(horizontal <= vertical)
		glOrtho(-100.0,100.0,-100.0/AspectRatio,100.0/AspectRatio,100.0, -100.0); 
	else
		 glOrtho(-100.0*AspectRatio,100.0*AspectRatio,-100.0,100.0,100.0,-100.0);    */                  

	 if(horizontal <= vertical) {
        glOrtho(-7.5, 7.5, -7.5/AspectRatio, 7.5/AspectRatio, 10.0, -10.0); 
    } else { 
        glOrtho(-7.5*AspectRatio, 7.5*AspectRatio, -7.5, 7.5, 10.0, -10.0);                     
    }

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}


int _tmain(int argc, _TCHAR* argv[])
{
	srand(time(NULL));
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB |GLUT_DEPTH);
    glutInitWindowSize(800, 800);
	
    glutCreateWindow("jajko");
    glutDisplayFunc(RenderScene);
	glutReshapeFunc(ChangeSize);
	glutKeyboardFunc(keys);
	glutIdleFunc(spinEgg);
    MyInit();
    glEnable(GL_DEPTH_TEST);
    glutMainLoop();
   
}

