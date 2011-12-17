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
float nor[N][N][3];
int which = 2;
int model = 3;
int kk = 6;

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
	

	float div = N * 1.0f;
	for(int i=0; i<N-1; i++){
        for(int j=0; j<N-1; j++)
		{
			glBegin(GL_TRIANGLES);
			//glColor3fv(col[i][j]);
			glNormal3fv(nor[i][j]);
			glTexCoord2f(i / div, j/div);
			glVertex3fv(tab[i][j]);
				
				
			//glColor3fv(col[i+1][j]);
			glNormal3fv(nor[i+1][j]);
			glTexCoord2f((i+1)/div, j/div);
			glVertex3fv(tab[i+1][j]);
				
				
			//glColor3fv(col[i][j+1]);
			glNormal3fv(nor[i][j+1]);
			glTexCoord2f(i/div, (j+1)/div);
			glVertex3fv(tab[i][j+1]);
			glEnd();

			glBegin(GL_TRIANGLES);
			
			glNormal3fv(nor[i+1][j+1]);
			glTexCoord2f((i+1)/div, (j+1)/div);
			glVertex3fv(tab[i+1][j+1]);
				
				
			//glColor3fv(col[i+1][j]);
			glNormal3fv(nor[i+1][j]);
			glTexCoord2f((i+1)/div, j/div);
			glVertex3fv(tab[i+1][j]);
				
				
			//glColor3fv(col[i][j+1]);
			glNormal3fv(nor[i][j+1]);
			glTexCoord2f(i/div, (j+1)/div);
			glVertex3fv(tab[i][j+1]);
			glEnd();
		}
    }
	
	
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



void triangle(){
	
}

void RenderScene(void)
{


    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glLoadIdentity();
	gluLookAt(viewer[0],viewer[1],viewer[2], 0.0, 0.0, 0.0, 0.0, p, 0.0);
    Axes();
	
	
	if(which == 1){
		glBegin(GL_TRIANGLES);

        //glNormal3f(...);
        glTexCoord2f(0.0f, 0.0f);
		//glColor3f(1.0f, 0.0f, 0.0f);
        glVertex3f(0.0f, 4.0f,0.0f);

		//glNormal3f(...);
       glTexCoord2f(1.0f, 0.0f);
        glVertex3f(-5.0f, -2.0f, 0.0f);

        //glNormal3f(...);
       glTexCoord2f(0.5f, 1.0f);
        glVertex3f(5.0f,-2.0f, 0.0f);
   
		glEnd();
	}
	else if(which ==2){
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
	} else {
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

	if(kk == 0) {
		glBegin(GL_QUADS);                           	// draw square
		   glTexCoord2f(0.0f, 0.0f);           	// set color to green
		  glVertex3f(-5.0f, -5.0f, 5.0f);
		   glTexCoord2f(0.0f, 1.0f);            	// set color to white
		  glVertex3f( -5.0f, -5.0f, -5.0f);
		   glTexCoord2f(1.0f, 1.0f);          	// set color to blue
		  glVertex3f( 5.0f, -5.0f, -5.0f);
			glTexCoord2f(1.0f, 0.0f);           	// set color to yellow
		  glVertex3f( 5.0f, -5.0f, 5.0f);
	   glEnd();
	}

	if(kk == 1) {
		glBegin(GL_TRIANGLES);     	// draw triangle
      glTexCoord2f(0.0f, 0.0f);
      glVertex3f(  0.0f,  3.0f, 0.0f);
      glTexCoord2f(1.0f, 0.0f);
      glVertex3f(-5.0f, -5.0f, 5.0f);
      glTexCoord2f(0.0f, 1.0f);
      glVertex3f( 5.0f, -5.0f, 5.0f);
      
      
	glEnd();
	}

	if(kk == 2) {
	 glBegin(GL_TRIANGLES);
	 glTexCoord2f(0.0f, 0.0f);
      glVertex3f(  0.0f,  3.0f, 0.0f);
      glTexCoord2f(1.0f, 0.0f);
		glVertex3f( 5.0f, -5.0f, 5.0f);
      glTexCoord2f(1.0f, 1.0f);
      glVertex3f( 5.0f, -5.0f, -5.0f);
	  glEnd();
	}

	if(kk == 3) {
	 glBegin(GL_TRIANGLES);
	 glTexCoord2f(0.0f, 0.0f);
      glVertex3f(  0.0f,  3.0f, 0.0f);
      glTexCoord2f(1.0f, 0.0f);
      glVertex3f( -5.0f, -5.0f, -5.0f);
       glTexCoord2f(1.0f, 1.0f);
      glVertex3f(-5.0f, -5.0f, 5.0f);
	  glEnd();
	}

	if(kk == 4) {
		glBegin(GL_TRIANGLES);
	 glTexCoord2f(0.0f, 0.0f);
      glVertex3f(  0.0f,  3.0f, 0.0f);
      glTexCoord2f(1.0f, 0.0f);
      glVertex3f( -5.0f, -5.0f, -5.0f);
		   glTexCoord2f(1.0f, 1.0f);
		  glVertex3f(-5.0f, -5.0f, 5.0f);
	  glEnd();	
	}

	if(kk == 5){
		glBegin(GL_TRIANGLES);
	 glTexCoord2f(0.0f, 0.0f);
      glVertex3f(  0.0f,  3.0f, 0.0f);
      glTexCoord2f(1.0f, 0.0f);
      glVertex3f(-5.0f, -5.0f, 5.0f);
		   glTexCoord2f(1.0f, 1.0f);
		  glVertex3f(-5.0f, -5.0f, 5.0f);
	  glEnd();	
	}

	
   if(kk == 6) {
		glBegin(GL_TRIANGLE_FAN);     	// draw triangle
		  glTexCoord2f(0.0f, 0.0f);
		  glVertex3f(  0.0f,  3.0f, 0.0f);
		  glTexCoord2f(1.0f, 0.0f);
		  glVertex3f(-5.0f, -5.0f, 5.0f);
		  glTexCoord2f(0.0f, 1.0f);
		  glVertex3f( 5.0f, -5.0f, 5.0f);
		  glTexCoord2f(1.0f, 1.0f);
		  glVertex3f( 5.0f, -5.0f, -5.0f);
		  glTexCoord2f(1.0f, 0.0f);
		  glVertex3f( -5.0f, -5.0f, -5.0f);
		   glTexCoord2f(0.0f, 1.0f);
		  glVertex3f(-5.0f, -5.0f, 5.0f);
	   glEnd();
	  
	  

	   glBegin(GL_QUADS);                           	// draw square
		   glTexCoord2f(0.0f, 0.0f);           	// set color to green
		  glVertex3f(-5.0f, -5.0f, 5.0f);
		   glTexCoord2f(0.0f, 1.0f);            	// set color to white
		  glVertex3f( -5.0f, -5.0f, -5.0f);
		   glTexCoord2f(1.0f, 1.0f);          	// set color to blue
		  glVertex3f( 5.0f, -5.0f, -5.0f);
			glTexCoord2f(1.0f, 0.0f);           	// set color to yellow
		  glVertex3f( 5.0f, -5.0f, 5.0f);
	   glEnd();
	   }
	}
	glFlush();
    glutSwapBuffers();
}

void keys(unsigned char key, int x, int y)
{
    if(key == 'p') model = 1;
    if(key == 'w') model = 2;
    if(key == 's') model = 3;
	
	if(key == 'z') kk = 0;
	if(key == 'x') kk = 1;
	if(key == 'c') kk = 2;
	if(key == 'v') kk = 3;
	if(key == 'b') kk = 4;
	if(key == 'n') kk = 5;
	if(key == 'm') kk = 6;


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


GLbyte *LoadTGAImage(const char *FileName, GLint *ImWidth, GLint *ImHeight, GLint *ImComponents, GLenum *ImFormat)
{

	#pragma pack(1)           
    typedef struct                       
    {
        GLbyte    idlength;             
        GLbyte    colormaptype;          
        GLbyte    datatypecode;            
        unsigned short    colormapstart; 
        unsigned short    colormaplength;
        unsigned char     colormapdepth;  
        unsigned short    x_orgin;        
        unsigned short    y_orgin;        
        unsigned short    width;         
        unsigned short    height;        
        GLbyte    bitsperpixel;                  
        GLbyte    descriptor;            
    }TGAHEADER;
    #pragma pack(8)


    FILE *pFile;                   
    TGAHEADER tgaHeader;           
    unsigned long lImageSize;       
    short sDepth;                   
    GLbyte    *pbitsperpixel = NULL; 

    *ImWidth = 0;               
    *ImHeight = 0;
    *ImFormat = GL_BGR_EXT;
    *ImComponents = GL_RGB8;
   
    pFile = fopen(FileName, "rb");
    if(pFile == NULL)
      return NULL;

	fread(&tgaHeader, sizeof(TGAHEADER), 1, pFile);
                

	*ImWidth = tgaHeader.width;
    *ImHeight = tgaHeader.height;
    sDepth = tgaHeader.bitsperpixel / 8;


	if(tgaHeader.bitsperpixel != 8 && tgaHeader.bitsperpixel != 24 && tgaHeader.bitsperpixel != 32)
        return NULL;
	lImageSize = tgaHeader.width * tgaHeader.height * sDepth;

	pbitsperpixel = (GLbyte*)malloc(lImageSize * sizeof(GLbyte));
   
      if(pbitsperpixel == NULL)
        return NULL;

    if(fread(pbitsperpixel, lImageSize, 1, pFile) != 1)
        {
        free(pbitsperpixel);
        return NULL;
        }
   
	switch(sDepth)
	{
        case 3:    

            *ImFormat = GL_BGR_EXT;

            *ImComponents = GL_RGB8;

            break;

        case 4:

            *ImFormat = GL_BGRA_EXT;

            *ImComponents = GL_RGBA8;

            break;

        case 1:

            *ImFormat = GL_LUMINANCE;

            *ImComponents = GL_LUMINANCE8;

            break;

        };
	fclose(pFile);
	return pbitsperpixel;
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
	GLbyte *pBytes;
	GLint ImWidth, ImHeight, ImComponents;
	GLenum ImFormat;
	if(which !=2 )
		glEnable(GL_CULL_FACE);
	//if(which != 2)
		pBytes = LoadTGAImage("C:\\Users\\jacek\\Desktop\\D1_t.tga", &ImWidth, &ImHeight, &ImComponents, &ImFormat);
	//else
		//pBytes = LoadTGAImage("C:\\Users\\jacek\\Desktop\\earth.tga", &ImWidth, &ImHeight, &ImComponents, &ImFormat);
	glTexImage2D(GL_TEXTURE_2D, 0, ImComponents, ImWidth, ImHeight, 0, ImFormat, GL_UNSIGNED_BYTE, pBytes);
	free(pBytes);
	glEnable(GL_TEXTURE_2D);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR); 
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
	GLfloat mat_ambient[]  = {1.0, 1.0, 1.0, 1.0};       
    GLfloat mat_diffuse[]  = {1.0, 1.0, 1.0, 1.0};
    GLfloat mat_specular[] = {1.0, 1.0, 1.0, 1.0};
    GLfloat mat_shininess  = {20.0};
    GLfloat light_position[] = {0.0, 0.0, 10.0, 1.0};   
    GLfloat light_ambient[] = {0.1, 0.1, 0.1, 1.0};
    GLfloat light_diffuse[] = {1.0, 1.0, 1.0, 1.0};       
    GLfloat light_specular[]= {1.0, 1.0, 1.0, 1.0};
    GLfloat att_constant  = {1.0};
    GLfloat att_linear    = {0.05};
    GLfloat att_quadratic  = {0.001};
    glMaterialfv(GL_FRONT, GL_SPECULAR, mat_specular);
    glMaterialfv(GL_FRONT, GL_AMBIENT, mat_ambient);
    glMaterialfv(GL_FRONT, GL_DIFFUSE, mat_diffuse);
    glMaterialf(GL_FRONT, GL_SHININESS, mat_shininess);
	glLightfv(GL_LIGHT0, GL_AMBIENT, light_ambient);
    glLightfv(GL_LIGHT0, GL_DIFFUSE, light_diffuse);
    glLightfv(GL_LIGHT0, GL_SPECULAR, light_specular);
    glLightfv(GL_LIGHT0, GL_POSITION, light_position);

    glLightf(GL_LIGHT0, GL_CONSTANT_ATTENUATION, att_constant);
    glLightf(GL_LIGHT0, GL_LINEAR_ATTENUATION, att_linear);
    glLightf(GL_LIGHT0, GL_QUADRATIC_ATTENUATION, att_quadratic);
	glShadeModel(GL_SMOOTH); // w³aczenie ³agodnego cieniowania
    glEnable(GL_LIGHTING);   // w³aczenie systemu oœwietlenia sceny
    glEnable(GL_LIGHT0);     // w³¹czenie Ÿród³a o numerze 0
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

	std :: cin >> which;
	srand(time(NULL));

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
	glutMouseFunc(Mouse);
// Ustala funkcj? zwrotn? odpowiedzialn? za badanie stanu myszy
   
	glutMotionFunc(Motion);
// Ustala funkcj? zwrotn? odpowiedzialn? za badanie ruchu myszy
	//glutIdleFunc(spinEgg);
    MyInit();
    glEnable(GL_DEPTH_TEST);
    glutMainLoop();
   
}

