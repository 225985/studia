#include <iostream>
#include <fstream>
#include <vector>
#include <stdlib.h>
#include <math.h>
#include <cfloat>
#include <GLUT/glut.h>
#include <OpenGL/OpenGL.h>

using namespace std;

// macros
#define TRIPLE(f) for(int i=0; i<3; i++){ f; }
#define TRACE_MAX 10000
#define min(x,y) ((x)>(y) ? (y) : (x))

// data structures
struct Sphere {
    float radius;
    float position[3];
    float specular[3];
    float diffuse[3];
    float ambient[3];
    float specularhinines;
};

struct Source {
    float position[3];
    float specular[3];
    float diffuse[3];
    float ambient[3];
};

// params
int dimensions[2];
float background[3];
float global[3];
vector<Sphere> spheres;
vector<Source> sources;
float viewport_size = 15.0;
float pix2angle;
float light_pos[4] = {0.0, 0.0, 0.0, 0.0};
float starting_point[3];
float starting_directions[] = {0.0, 0.0, -1.0};

float inter[3];
float vec_n[3];
float ref[3];
float color[3];
int inters;
float inters_c[3];
GLubyte pixel[1][1][3];


void draw();
void init();

float prod(float * p1, float * p2);
void normalization(float * p);
void trace(float * p, float * v, int step);
void phong(float * v, Sphere * sp);
void normal(Sphere * sp);
Sphere * intersect(float * v1, float * v2);
void reflect(float * v);
void readFile();


// functions

float prod(float * p1, float * p2){
    return (p1[0]*p2[0]+p1[1]*p2[1]+p1[2]*p2[2]);
}

Sphere * intersect(float * v1, float * v2){
    Sphere * s = NULL;
    float pre = FLT_MAX;
    float a, b, c, d, r;
    
    for(vector<Sphere>::iterator it=spheres.begin(); it < spheres.end(); it++){
        Sphere sp = *it;
        float * spp = sp.position;
        
        a = v2[0] * v2[0] + v2[1] * v2[1] + v2[2] * v2[2];
        
        b = 2 * (v2[0] * (v1[0] - spp[0]) +
                 v2[1] * (v1[1] - spp[1]) +
                 v2[2] * (v1[2] - spp[2]));
        
        c = v1[0] * v1[0] + v1[1] * v1[1] + v1[2] * v1[2] -
        2*(spp[0] * v1[0] +
           spp[1] * v1[1] +
           spp[2] * v1[2]) +
        spp[0]*spp[0] + spp[1] * spp[1] + spp[2] * spp[2] -
        sp.radius * sp.radius;
        
        d = b*b - 4*a*c;

        if(d >= 0){
            r = (-b - sqrt(d))/(2*a);
            if(r > 0 && r < pre){
                inter[0] = v1[0] + r*v2[0];
                inter[1] = v1[1] + r*v2[1];
                inter[2] = v1[2] + r*v2[2];
                pre = sqrt((inter[0] - v1[0]) * (inter[0] * v1[0]) +
                         (inter[1] - v1[1]) * (inter[1] * v1[1]) +
                         (inter[2] - v1[2]) * (inter[2] * v1[2]));
                s = &(*it);
            }
        }
        
    }
    return s;
    
}

void normalization(float * p){
    float d = 0.0;
    int i;
    
    TRIPLE(d += p[i] * p[i]);
    
    d = sqrt(d);
    
    if(d > 0.0){
        for(i=0; i<3; i++) p[i] /= d;
    }
}

void normal(Sphere * sp){
    for(int i=0; i<3; i++){
        vec_n[i] = inter[i] - sp->position[i];
    }
    normalization(vec_n);
}

void reflect(float * v){
    float inv[3];
    TRIPLE(inv[i] = -v[i]);
    
    float cos = prod(vec_n, inv);
    TRIPLE(ref[i] = 2 * cos * vec_n[i] - inv[i]);
    normalization(ref);
}

void phong(float * v, Sphere * sp){
    float light_vec[3];
    float reflection_vector[3];
    float viewer_v[3];
    float n_dot_l, v_dot_r;
    
    TRIPLE(
        viewer_v[i] = -v[i];
        inters_c[i] = 0;
    )
    
    for(vector<Source>::iterator it=sources.begin(); it!= sources.end(); it++){
        Source src = *it;
        float * srcp = src.position;
        TRIPLE(light_vec[i] = srcp[i] - inter[i])
        
        normalization(light_vec);
        n_dot_l = prod(light_vec, vec_n);
        TRIPLE(reflection_vector[i] = 2*n_dot_l*vec_n[i] - light_vec[i])
        
        normalization(reflection_vector);
        v_dot_r = prod(reflection_vector, viewer_v);
        
        if(v_dot_r < 0) v_dot_r = 0;
        
        if(n_dot_l > 0){
            float x = sqrt((srcp[0] - inter[0])*(srcp[0] - inter[0]) +
                           (srcp[1] - inter[1])*(srcp[1] - inter[1]) +
                           (srcp[2] - inter[2])*(srcp[2] - inter[2]));
            TRIPLE(
                inters_c[i] += (1.0/(1.0 + 0.01*x + 0.001*x*x)) *
                (sp->diffuse[i]*src.diffuse[i]*n_dot_l + sp->specular[i]*src.specular[i]*pow(v_dot_r, sp->specularhinines)) +
                sp->ambient[i]*src.ambient[i];
            )
        } else {
            TRIPLE(inters_c[i] += sp->ambient[i]*global[i])
        }
    }
    
}

void trace(float * p, float * v, int step){
    Sphere * sp = intersect(p, v);
    if(sp != NULL){
        normal(sp);
        reflect(v);
        phong(v, sp);
        TRIPLE(color[i] += inters_c[i]);
        
        if(step < TRACE_MAX ) trace(inter, ref, step+1);
    }
}

void draw(){
    int  x, y;
    float xf, yf;
    float width_2 = dimensions[0]/2;
    float height_2 = dimensions[1]/2;
    
    glClear(GL_COLOR_BUFFER_BIT);
    glFlush();
    
    
    for (y = height_2; y > -height_2; y--){
        for (x = -width_2; x < width_2; x++){
            xf = (float)x/(dimensions[0]/viewport_size);
            yf = (float)y/(dimensions[1]/viewport_size);
            
            starting_point[0] =  xf;
            starting_point[1] =  yf;
            starting_point[2] =  viewport_size;
            
            TRIPLE(color[i] = 0.0);
            
            trace(starting_point, starting_directions, 1);
            
            TRIPLE(
                if(color[i] == 0.0) color[i] = background[i];
                pixel[0][0][i] = min(255, color[i] * 255);
            w);
            
            glRasterPos3f(xf, yf, 0);
            glDrawPixels(1, 1, GL_RGB, GL_UNSIGNED_BYTE, pixel);
            
        }
    }
    glFlush();
}

void readFile(){
    fstream in("/Users/teamon/Downloads/scene.txt", ios :: in);
    string s;
    
    while(!in.eof()){
        in >> s;
        
        if(s == "dimensions"){
            in >> dimensions[0];
            in >> dimensions[1];
        } else if(s == "background"){
            TRIPLE(in >> background[i]);
        } else if(s == "global"){
            TRIPLE(in >> global[i]);
        } else if(s == "sphere"){
            Sphere sph;
            in >> sph.radius;
            TRIPLE(in >> sph.position[i]);
            TRIPLE(in >> sph.specular[i]);
            TRIPLE(in >> sph.diffuse[i]);
            TRIPLE(in >> sph.ambient[i]);
            in >> sph.specularhinines;
            spheres.push_back(sph);
        } else if(s == "source"){
            Source src;
            TRIPLE(in >> src.position[i]);
            TRIPLE(in >> src.specular[i]);
            TRIPLE(in >> src.diffuse[i]);
            TRIPLE(in >> src.ambient[i]);
            sources.push_back(src);
        }
        
    }
    
    in.close();
}

void init(){
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(-viewport_size/2, viewport_size/2, -viewport_size/2, viewport_size/2, -viewport_size/2, viewport_size/2);
    glMatrixMode(GL_MODELVIEW);
}

int main (int argc, char ** argv){
    readFile();
    
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA);
    glutInitWindowSize(dimensions[0], dimensions[1]);
    glutCreateWindow("Ray Tracing");
    init();
    glutDisplayFunc(draw);
    glutMainLoop();
    
    return 0;
}

