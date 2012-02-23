#include "stdafx.h"
#include <windows.h>
#include <gl/GL.h>
#include <GL/glut.h>
#include <math.h>
#include <stdio.h>
#include <float.h>
#include <iostream>
#include <fstream>
using namespace std;

const int SOURCE = 100;
const int SPHERE = 100;
const int MAX_STEPS = 10000;

typedef float point[3];

int Trace(float *p, float *v, int step); // cross point of sphere layer and beam
void Phong(float * v, int which); // phong model
float dotProduct(point p1, point p2); // dot product of two vectores
void Normalization(point p); // normalization of vectore
int Intersect(float *point, float *vec); //
void Normal(int typ); //
void Reflect(float *v); //
bool ParseFile(); // parse file and load data

int im_size = 400;
int width, height;
int sphereCount = 0;
int sourceCount = 0;

float viewport_size = 15.0;

//light sources parameters
float light_position[SOURCE][3];
float light_specular[SOURCE][3];
float light_diffuse[SOURCE][3];
float light_ambient[SOURCE][3];

//spheres parameters
float sphere_radius[SPHERE];
float sphere_pos[SPHERE][3];
float sphere_specular[SPHERE][3];
float sphere_diffuse[SPHERE][3];
float sphere_ambient[SPHERE][3];
float sphere_specularhininess[SPHERE];

float global_a[3];

float starting_point[3]; // punkt, z którego wychodzi promieñ
float starting_directions[] = {0.0, 0.0, -1.0}; // wektor opisuj¹cy kierunek promienia


float inter[3]; // współrzędne (x,y,z) punktu przecięcia promienia i sfery
float normalVector[3];
float ref[3];
float color[3];
float background[3];

int inters; // zmienna określająca, czy sfera została przecięta przez
float inters_c[3]; // składowe koloru dla oświetlonego punktu na powierzchni sfery
GLubyte pixel[1][1][3]; // składowe koloru rysowanego piksela


int Trace(float *p, float *v, int k)
{

	if( k > MAX_STEPS )
	{
		return -1;
	}

	int con = Intersect(p, v);

	if(con == -1)
		return con; //nothing
	else if(con < -1) {
		return con;  //light source
	}
	else if (con >=0 ) // is object
	{
		Normal(con);
		Reflect(v);
		Phong(v, con);
		for(int i=0; i<3; i++)
		{
			color[i] += inters_c[i];;
		}
		Trace (inter, ref, k+1);
	}
	
	return 0;
}

int Intersect(float *point, float *vec){
	int st = -1;
	float l = FLT_MAX, a, b, c, d, r;

	

	for(int i=0; i< sphereCount; i++)
	{
		a = vec[0]*vec[0] + vec[1]*vec[1] + vec[2]*vec[2];
		b = 2*(vec[0]*(point[0] - sphere_pos[i][0]) + vec[1]*(point[1] - sphere_pos[i][1]) + vec[2]*(point[2] - sphere_pos[i][2]));
		c = point[0]*point[0] + point[1]*point[1] + point[2]*point[2] - 2*(sphere_pos[i][0]*point[0] + sphere_pos[i][1]*point[1] + sphere_pos[i][2]*point[2]) + sphere_pos[i][0]*sphere_pos[i][0] + sphere_pos[i][1]*sphere_pos[i][1] + sphere_pos[i][2]*sphere_pos[i][2] - sphere_radius[i]*sphere_radius[i];
		d = b*b-4*a*c;
		if (d >= 0 ) {
			r = (-b - sqrt(d))/(2*a);
			if (r > 0 && r < l) {
				inter[0] = point[0] + r*vec[0];
				inter[1] = point[1] + r*vec[1];
				inter[2] = point[2] + r*vec[2];
				l = sqrt((inter[0]-point[0])*(inter[0]-point[0]) + (inter[1]-point[1])*(inter[1]-point[1]) + (inter[2]-point[2])*(inter[2]-point[2]));
				st = i;
			}
		}

	}

	if(st > -1) return st;
	l = FLT_MAX;
	for (int i = 0; i < sourceCount; i++) {
        if ((light_position[i][0] - point[0]) / vec[0]
                == (light_position[i][1] - point[1]) / vec[1]
                == (light_position[i][2] - point[2]) / vec[2]) {
            r = sqrt((light_position[i][0] - point[0]) * (light_position[i][0] - point[0])
                    + (light_position[i][1] - point[1]) * (light_position[i][1] - point[1])
                    + (light_position[i][2] - point[2]) * (light_position[i][2] - point[2]));

            if (r < l ) {
                inter[0] = light_position[i][0];
                inter[1] = light_position[i][1];
                inter[2] = light_position[i][2];
                l = r;
                st = -2 - i;
            }
        }
    }

	return st;
}

void Normal(int sphere)
{
	//normal vector for sphere : [x - x0, y - y0, z - z0]
	for(int i=0; i<3; i++)
	{
		normalVector[i] = inter[i] - sphere_pos[sphere][i];
	}
	Normalization(normalVector);
}

void Reflect(float * v)
{
	//ref = 2 * cosx * normal vector - inv(v) => cosx = (normal * inv(v)) / (|normal| * |inv(v)|)
	float inv[3] = {-v[0], -v[1], -v[2]};
	float cos = dotProduct(normalVector, inv);
	for(int i=0; i<3; i++)
	{
		ref[i] = 2 * cos * normalVector[i] - inv[i];
	}
	Normalization(ref);
}

void Phong(float * v, int which)
{
	float light_vec[3]; // wektor wskazujący źródeł
	float reflection_vector[3]; // wektor kierunku odbicia światła
	float viewer_v[3] = {-v[0], -v[1], -v[2]}; // wektor kierunku obserwacji
	float n_dot_l, v_dot_r; // zmienne pomocnicze

	for(int i=0; i<3; i++)
	{
		inters_c[i] = 0.0;
	}

	for(int i=0; i<sourceCount; i++)
	{

		for(int j=0; j<3; j++)
		{
			light_vec[j] = light_position[i][j] - inter[j];
		}

		Normalization(light_vec); // normalizacja wektora kierunku świecenia źródła
		n_dot_l = dotProduct(light_vec, normalVector);
		for(int j=0; j<3; j++)
		{
			reflection_vector[j] = 2*(n_dot_l)*normalVector[j] - light_vec[j];
		}

		Normalization(reflection_vector); // normalizacja wektora kierunku światła odbitego
		v_dot_r = dotProduct(reflection_vector, viewer_v);

		if(v_dot_r < 0) // obserwator nie widzi oświetlanego punktu
			v_dot_r = 0;

		if (n_dot_l > 0)
		{
			float x = sqrt((light_position[i][0] - inter[0])*(light_position[i][0] - inter[0]) +(light_position[i][1] - inter[1])*(light_position[i][1] - inter[1]) + (light_position[i][2] - inter[2])*(light_position[i][2] - inter[2]));
			for(int j=0; j<3; j++)
			{
				inters_c[j] += (1.0/(1.0 + 0.01*x + 0.001*x*x))*(sphere_diffuse[which][j]*light_diffuse[i][j]*n_dot_l + sphere_specular[which][j]*light_specular[i][j]*pow(double(v_dot_r), (double)sphere_specularhininess[which])) + sphere_ambient[which][j]*light_ambient[i][j];
			}
		}
		else
		{
			for(int j=0; j<3; j++)
			{
				inters_c[j] += sphere_ambient[which][j]*global_a[j];
			}
		}
	}
}


void Normalization(point p)
{
	float d =0.0;
	int i;

	for(i=0; i<3; i++)
	{
		d+=p[i]*p[i];
	}

	d=sqrt(d);

	if(d>0.0)
	{
		for(i=0; i<3; i++)
		{
			p[i]/=d;
		}
	}

}


float dotProduct(point p1, point p2)
{
	return (p1[0]*p2[0]+p1[1]*p2[1]+p1[2]*p2[2]);
}


void Display(void)
{
	int x, y; // pozycja rysowanego piksela "całkowitoliczbowa"
	float x_fl, y_fl; // pozycja rysowanego piksela "zmiennoprzecinkowa"
	int im_size_2; // połowa rozmiaru obrazu w pikselach

	im_size_2 = im_size/2; // obliczenie połowy rozmiaru obrazu w pikselach
	glClear(GL_COLOR_BUFFER_BIT);
	glFlush();

	for (y = im_size_2; y > -im_size_2; y--)
	{
		for (x = -im_size_2; x < im_size_2; x++)
		{
			x_fl = (float)x/(im_size/viewport_size);
			y_fl = (float)y/(im_size/viewport_size);

			starting_point[0] = x_fl;
			starting_point[1] = y_fl;
			starting_point[2] = viewport_size;

			for(int i=0; i<3; i++)
			{
				color[i] = 0.0;
			}

			int p = Trace(starting_point, starting_directions, 1);

			for(int i=0; i<3; i++)
			{
				if(p == -1)
					color[i] = background[i];
				else if(p < -1) {
					color[i] = background[i];
				}

				if (color[i] > 1)
					pixel[0][0][i] = 255;
				else
					pixel[0][0][i] = color[i]*255;
			}

			glRasterPos3f(x_fl, y_fl, 0);
			glDrawPixels(1, 1, GL_RGB, GL_UNSIGNED_BYTE, pixel);
		}
	}
	glFlush();
}





bool ParseFile()
{
	fstream in("scene.txt", ios :: in);
	char data[100];

	if(!in)
	{
		return false;
	}

	while(!in.eof())
	{
		in >> data;
		switch(data[0])
		{
		case 'd' : in >> width; in >> height; break;
		case 'b' :
			for(int i=0; i<3; i++)
			{
				in >> background[i];
			}; break;
		case 'g' :
			for(int i=0; i<3; i++)
			{
				in >> global_a[i];
			}; break;
		case 's' :
			switch(data[1]) {
			case 'p' :
				{
					in >> sphere_radius[sphereCount];
					for(int i=0; i<3; i++)
					{
						in >> sphere_pos[sphereCount][i];
					}

					for(int i=0; i<3; i++)
					{
						in >> sphere_specular[sphereCount][i];
					}

					for(int i=0; i<3; i++)
					{
						in >> sphere_diffuse[sphereCount][i];
					}

					for(int i=0; i<3; i++)
					{
						in >> sphere_ambient[sphereCount][i];
					}

					in >> sphere_specularhininess[sphereCount];
					sphereCount++;
				}; break;
			case 'o' :
				{
					for(int i=0; i<3; i++)
					{
						in >> light_position[sourceCount][i];
					}

					for(int i=0; i<3; i++)
					{
						in >> light_specular[sourceCount][i];
					}

					for(int i=0; i<3; i++)
					{
						in >> light_diffuse[sourceCount][i];
					}

					for(int i=0; i<3; i++)
					{
						in >> light_ambient[sourceCount][i];
					}
					sourceCount++;
				}; break;
			}; break;
		}
	}
	in.close();
	return true;
}

void Myinit(void)
{
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(-viewport_size/2, viewport_size/2, -viewport_size/2, viewport_size/2, -viewport_size/2, viewport_size/2);
	glMatrixMode(GL_MODELVIEW);
}


int _tmain(int argc, _TCHAR* argv[])
{
	bool st = ParseFile();

	if(st)
	{
		glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA);
		glutInitWindowSize(im_size, im_size);
		glutCreateWindow("Ray Traycing - Jacek Wieczorek 181043");
		Myinit();
		glutDisplayFunc(Display);
		glutMainLoop();
	}
	else
	{
		cout << "Error - file not found \n";
		cin.get();
	}
}


