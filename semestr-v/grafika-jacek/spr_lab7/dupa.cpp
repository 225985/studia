gist
jacbar

    Dashboard
    Inbox 0
    Account Settings
    Log Out

    New Gist
    My Gists
    Starred Gists
    All Gists
    Back to GitHub

mlen (owner)
Revisions

    43bf1b mlen December 30, 2011

gist: 1a78d2d1f63062ddb9b5 Download_button fork star
private
Private Clone URL: 	
git@gist.github.com:1a78d2d1f63062ddb9b5.git
main.c #
raw

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
174
175
176
177
178
179
180
181
182
183
184
185
186
187
188
189
190
191
192
193
194
195
196
197
198
199
200
201
202
203
204
205
206
207
208
209
210
211
212
213
214
215
216
217
218
219
220
221
222
223
224
225
226
227
228
229
230
231
232
233
234
235
236
237
238
239
240
241
242
243
244
245
246
247
248
249
250
251
252
253
254
255
256
257
258
259
260
261
262
263
264
265
266
267
268
269
270
271
272
273
274
275
276
277
278
279
280
281
282
283
284
285
286
287
288
289
290
291
292
293
294
295
296
297
298
299
300
301
302
303
304
305
306
307
308
309
310
311
312
313
314
315
316
317
318
319
320
321
322
323
324
325
326
327
328
329
330
331
332
333
334
335
336
337
338
339
340
341
342
343
344
345
346
347
348
349
350
351
352
353
354
355
356
357
358
359
360
361
362
363
364
365
366
367
368
369
370
371
372
373
374
375
376
377
378
379
380
381
382
383
384
385
386
387
388
389
390
391
392
393
394
395
396
397
398
399
400
401
402
403
404
405
406
407
408
409
410
411
412
413
414
415
416
417
418
419
420
421
422
423
424
425
426
427
428
429
430
431
432
433
434
435
436
437
438
439
440
441
442
443
444
445
446
447
448
449
450
451
452
453
454
455
456
457

	

#include <gl/glut.h>
#include <gl/gl.h>
#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define COUNT 100

#define DOT(p1, p2) ((p1)[0]*(p2)[0]+(p1)[1]*(p2)[1]+(p1)[2]*(p2)[2])

typedef float point[3];
typedef float vector[3];
typedef float color[3];

typedef struct {
    float radius;
    float position[3];
    float specular[3];
    float diffuse[3];
    float ambient[3];
    float specularshininess;
} sphere_t;

typedef struct {
    float radius[3];
    float position[3];
    float specular[3];
    float diffuse[3];
    float ambient[3];
    float specularshininess;
} elipsoid_t;

typedef struct {
    float position[3];
    float specular[3];
    float diffuse[3];
    float ambient[3];
} light_t;

int aLights = 0;
int aSpheres = 0;
int aElipsoids = 0;

float global_a[3];
int im_size;
float viewport_size = 25;

float A = 1, B = .01, C = .001;

sphere_t Spheres[COUNT];
elipsoid_t Elipsoids[COUNT];
light_t Lights[COUNT];

GLubyte pixel[1][1][3]; // składowe koloru rysowanego piksela
float background[3]; // składowe koloru tła

int MAXstep = 50; // maksymalna ilość rekurencji

void readScene(char *filename) {
    int whtvr;
    int i = 0, j = 0, k = 0;
    char linebuffer[200];
    FILE *file;

    bzero(linebuffer, sizeof(linebuffer));

    file = fopen(filename, "r");
    assert(file != NULL);

    while (fgets(linebuffer, sizeof(linebuffer), file)) {
        if (sscanf(linebuffer, "dimensions %d %d", &im_size, &whtvr));

        else if (sscanf(linebuffer, "background %f %f %f", &(background[0]), &(background[1]), &(background[2])));

        else if (sscanf(linebuffer, "global %f %f %f", &(global_a[0]), &(global_a[1]), &(global_a[2])));

        else if (sscanf(linebuffer, "sphere %f %f %f %f %f %f %f %f %f %f %f %f %f %f",
                    &(Spheres[i].radius), &(Spheres[i].position[0]), &(Spheres[i].position[1]), &(Spheres[i].position[2]),
                    &(Spheres[i].specular[0]), &(Spheres[i].specular[1]), &(Spheres[i].specular[2]),
                    &(Spheres[i].diffuse[0]) , &(Spheres[i].diffuse[1]) , &(Spheres[i].diffuse[2]),
                    &(Spheres[i].ambient[0]) , &(Spheres[i].ambient[1]) , &(Spheres[i].ambient[2]),
                    &(Spheres[i].specularshininess))) {
            i++;

        } else if (sscanf(linebuffer, "elipso %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f",
                    &(Elipsoids[k].radius[0]), &(Elipsoids[k].radius[1]), &(Elipsoids[k].radius[2]),
                    &(Elipsoids[k].position[0]), &(Elipsoids[k].position[1]), &(Elipsoids[k].position[2]),
                    &(Elipsoids[k].specular[0]), &(Elipsoids[k].specular[1]), &(Elipsoids[k].specular[2]),
                    &(Elipsoids[k].diffuse[0]) , &(Elipsoids[k].diffuse[1]) , &(Elipsoids[k].diffuse[2]),
                    &(Elipsoids[k].ambient[0]) , &(Elipsoids[k].ambient[1]) , &(Elipsoids[k].ambient[2]),
                    &(Elipsoids[k].specularshininess))) {
            k++;

        } else if (sscanf(linebuffer, "source %f %f %f %f %f %f %f %f %f %f %f %f",
                    &(Lights[j].position[0]), &(Lights[j].position[1]), &(Lights[j].position[2]),
                    &(Lights[j].specular[0]), &(Lights[j].specular[1]), &(Lights[j].specular[2]),
                    &(Lights[j].diffuse[0]) , &(Lights[j].diffuse[1]), &(Lights[j].diffuse[2]),
                    &(Lights[j].ambient[0]) , &(Lights[j].ambient[1]), &(Lights[j].ambient[2]))) {
            j++;
        }

        bzero(linebuffer, sizeof(linebuffer));
    }

    aLights = j;
    aSpheres = i;
    aElipsoids = k;
    fclose(file);
    return;
}

void Normalization(vector p)
{
    float d = 0.0;
    int i;

    for (i = 0; i < 3; i++) {
        d += p[i] * p[i];
    }

    d = sqrt(d);

    if (d > 0.0) {
        for (i = 0; i < 3; i++) {
            p[i] /= d;
        }
    }
}

int Intersect(point p, vector v, float *inter, int *objectype) {
    int status = -1;
    float a, b, c, delta, r;
    //float length = sizeof(float);
    float proximity = -1;
    float proximtmp;

    // sprawdzamy czy na prostej naszego promienia nie ma źródła światła
    for (int j = 0; j < aLights; j++) {
        if ((Lights[j].position[0] - p[0]) / v[0]
                == (Lights[j].position[1] - p[1]) / v[1]
                == (Lights[j].position[2] - p[2]) / v[2]) {
            proximtmp = sqrt((Lights[j].position[0] - p[0]) * (Lights[j].position[0] - p[0])
                    + (Lights[j].position[1] - p[1]) * (Lights[j].position[1] - p[1])
                    + (Lights[j].position[2] - p[2]) * (Lights[j].position[2] - p[2]));

            if (proximtmp < proximity || proximity == -1) {
                inter[0] = Lights[j].position[0];
                inter[1] = Lights[j].position[1];
                inter[2] = Lights[j].position[2];
                proximity = proximtmp;
                status = -2 - j;
            }
        }
    }

    for (int i = 0; i < aElipsoids ; i++) {
        int r1 = (Elipsoids[i].radius[0] * Elipsoids[i].radius[0]),
                r2 = (Elipsoids[i].radius[1] * Elipsoids[i].radius[1]),
                r3 = (Elipsoids[i].radius[2] * Elipsoids[i].radius[2]);
        a = v[0] * v[0] * (r2 * r1)
            + v[1] * v[1] * (r1 * r3)
            + v[2] * v[2] * (r1 * r2);
        b = 2 * ((p[0] - Elipsoids[i].position[0]) * v[0] * (r2 * r1)
                + (p[1] - Elipsoids[i].position[1]) * v[1] * (r1 * r3)
                + (p[2] - Elipsoids[i].position[2]) * v[2] * (r1 * r2)
                );
        c = (p[0] - Elipsoids[i].position[0]) * (p[0] - Elipsoids[i].position[0]) * (r2 * r1)
            + (p[1] - Elipsoids[i].position[1]) * (p[1] - Elipsoids[i].position[1]) * (r1 * r3)
            + (p[2] - Elipsoids[i].position[2]) * (p[2] - Elipsoids[i].position[2]) * (r1 * r2) - r1 * r2 * r3;
        delta = b * b - 4 * a * c;

        if (delta >= 0) { // jest co najmniej jeden punkt przecięcia
            r = (-b - sqrt(delta)) / (2 * a); // parametr dla bliższego punktu przecięcia

            if (r > 0 && (r < proximity || proximity == -1)) { //sprawdzamy czy znaleziony promień jest >0 i mniejszy od pozostałych
                inter[0] = p[0] + r * v[0]; // współrzędne punktu przecięcia
                inter[1] = p[1] + r * v[1];
                inter[2] = p[2] + r * v[2];
                proximity = sqrt((inter[0] - p[0]) * (inter[0] - p[0]) + (inter[1] - p[1]) * (inter[1] - p[1]) + (inter[2] - p[2]) * (inter[2] - p[2]));
                status = i;
                *objectype = 1;
            }
        }
    }

    for (int i = 0; i < aSpheres; i++) {
        a = v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
        b = 2 * (
                v[0] * (p[0] - Spheres[i].position[0])
                + v[1] * (p[1] - Spheres[i].position[1])
                + v[2] * (p[2] - Spheres[i].position[2])
                );
        c = p[0] * p[0] + p[1] * p[1] + p[2] * p[2]
            - 2 * (
                    Spheres[i].position[0] * p[0]
                    + Spheres[i].position[1] * p[1]
                    + Spheres[i].position[2] * p[2]
                  )
            + Spheres[i].position[0] * Spheres[i].position[0]
            + Spheres[i].position[1] * Spheres[i].position[1]
            + Spheres[i].position[2] * Spheres[i].position[2]
            - Spheres[i].radius * Spheres[i].radius;
        delta = b * b - 4 * a * c;

        if (delta >= 0) { // jest co najmniej jeden punkt przecięcia
            r = (-b - sqrt(delta)) / (2 * a); // parametr dla bliższego punktu przecięcia

            if (r > 0 && (r < proximity || proximity == -1)) { //sprawdzamy czy znaleziony promień jest >0 i mniejszy od pozostałych
                inter[0] = p[0] + r * v[0]; // współrzędne punktu przecięcia
                inter[1] = p[1] + r * v[1];
                inter[2] = p[2] + r * v[2];
                proximity = sqrt((inter[0] - p[0]) * (inter[0] - p[0]) + (inter[1] - p[1]) * (inter[1] - p[1]) + (inter[2] - p[2]) * (inter[2] - p[2]));
                status = i;
                *objectype = 0;
            }
        }
    }

    return status;
}

// Funkcja oblicza wektor normalny w punkcie
void NormalandReflected(int status, vector v, float *normal_vector, float *reflected_vector, float inter[], int objectype) {
    int r1 = (Elipsoids[status].radius[0] * Elipsoids[status].radius[0]),
        r2 = (Elipsoids[status].radius[1] * Elipsoids[status].radius[1]),
        r3 = (Elipsoids[status].radius[2] * Elipsoids[status].radius[2]);

    if (objectype == 0) {
        normal_vector[0] = inter[0] - Spheres[status].position[0];
        normal_vector[1] = inter[1] - Spheres[status].position[1];
        normal_vector[2] = inter[2] - Spheres[status].position[2];
    }

    if (objectype == 1) {
        normal_vector[0] = 2 * (inter[0] - Elipsoids[status].position[0]) / (r1 * r1);
        normal_vector[1] = 2 * (inter[1] - Elipsoids[status].position[1]) / (r2 * r2);
        normal_vector[2] = 2 * (inter[2] - Elipsoids[status].position[2]) / (r3 * r3);
    }

    Normalization(normal_vector);
    float inverted[3] = { -v[0], -v[1], -v[2]};
    Normalization(inverted);
    float scalar = DOT(inverted, normal_vector);
    reflected_vector[0] = 2 * (scalar) * normal_vector[0] - inverted[0];
    reflected_vector[1] = 2 * (scalar) * normal_vector[1] - inverted[1];
    reflected_vector[2] = 2 * (scalar) * normal_vector[2] - inverted[2];
    Normalization(reflected_vector);
}

void Phong(int nr, vector viewer_v, float normal_vector[], float inter[], float *pixelcolor, int objectype) {
    vector vec;
    vector reflection_vector;
    float n_dot_l, v_dot_r;

    for (int i = 0; i < aLights ; i++) {
        vec[0] = Lights[i].position[0] - inter[0]; // wektor wskazujący kierunek źródła
        vec[1] = Lights[i].position[1] - inter[1];
        vec[2] = Lights[i].position[2] - inter[2];
        Normalization(vec); // normalizacja wektora kierunku świecenia źródła
        n_dot_l = DOT(vec, normal_vector);
        reflection_vector[0] = 2 * (n_dot_l) * normal_vector[0] - vec[0];
        reflection_vector[1] = 2 * (n_dot_l) * normal_vector[1] - vec[1];
        reflection_vector[2] = 2 * (n_dot_l) * normal_vector[2] - vec[2];
        // obliczenie wektora opisującego kierunek światła odbitego od punktu na powierzchni sfery
        Normalization(reflection_vector); // normalizacja wektora kierunku światła odbitego
        v_dot_r = DOT(reflection_vector, viewer_v);

        if (v_dot_r < 0) { // obserwator nie widzi oświetlanego punktu
            v_dot_r = 0;
        }

        if (n_dot_l > 0) {
            // oświetlenie wyliczane jest ze wzorów dla modelu Phonga
            float eq = sqrt //część równania pod pierwiastkiem
                (
                 (Lights[i].position[0] - inter[0]) * (Lights[i].position[0] - inter[0])
                 + (Lights[i].position[1] - inter[1]) * (Lights[i].position[1] - inter[1])
                 + (Lights[i].position[2] - inter[2]) * (Lights[i].position[2] - inter[2])
                );

            if (objectype == 0) {
                pixelcolor[0] += (A / (A + B * eq + C * eq * eq))
                    * (
                            Spheres[nr].diffuse[0] * Lights[i].diffuse [0] * n_dot_l
                            + Spheres[nr].specular[0] * Lights[i].specular[0]
                            * pow((double) v_dot_r, (double) Spheres[nr].specularshininess)
                      )
                    + Spheres[nr].ambient[0] * Lights[i].ambient[0];
                pixelcolor[1] += (A / (A + B * eq + C * eq * eq))
                    * (Spheres[nr].diffuse[1] * Lights[i].diffuse [1] * n_dot_l
                            + Spheres[nr].specular[1] * Lights[i].specular[1]
                            * pow((double) v_dot_r, (double) Spheres[nr].specularshininess)
                      )
                    + Spheres[nr].ambient[1] * Lights[i].ambient[1];
                pixelcolor[2] += (A / (A + B * eq + C * eq * eq))
                    * (Spheres[nr].diffuse[2] * Lights[i].diffuse[2] * n_dot_l
                            + Spheres[nr].specular[2]
                            * Lights[i].specular[2]
                            * pow((double) v_dot_r, (double) Spheres[nr].specularshininess)
                      )
                    + Spheres[nr].ambient[2] * Lights[i].ambient[2];
            }

            if (objectype == 1) {
                pixelcolor[0] += (A / (A + B * eq + C * eq * eq))
                    * (
                            Elipsoids[nr].diffuse[0] * Lights[i].diffuse [0] * n_dot_l
                            + Elipsoids[nr].specular[0] * Lights[i].specular[0]
                            * pow((double) v_dot_r, (double) Elipsoids[nr].specularshininess)
                      )
                    + Elipsoids[nr].ambient[0] * Lights[i].ambient[0];
                pixelcolor[1] += (A / (A + B * eq + C * eq * eq))
                    * (Elipsoids[nr].diffuse[1] * Lights[i].diffuse [1] * n_dot_l
                            + Elipsoids[nr].specular[1] * Lights[i].specular[1]
                            * pow((double) v_dot_r, (double) Elipsoids[nr].specularshininess)
                      )
                    + Elipsoids[nr].ambient[1] * Lights[i].ambient[1];
                pixelcolor[2] += (A / (A + B * eq + C * eq * eq))
                    * (Elipsoids[nr].diffuse[2] * Lights[i].diffuse[2] * n_dot_l
                            + Elipsoids[nr].specular[2]
                            * Lights[i].specular[2]
                            * pow((double) v_dot_r, (double) Elipsoids[nr].specularshininess)
                      )
                    + Elipsoids[nr].ambient[2] * Lights[i].ambient[2];
            }
        }

        // punkt nie jest oświetlany
        // uwzględniane jest tylko światło rozproszone
        if (objectype == 0) {
            pixelcolor[0] += Spheres[nr].ambient[0] * global_a[0];
            pixelcolor[1] += Spheres[nr].ambient[1] * global_a[1];
            pixelcolor[2] += Spheres[nr].ambient[2] * global_a[2];
        }

        if (objectype == 1) {
            pixelcolor[0] += Elipsoids[nr].ambient[0] * global_a[0];
            pixelcolor[1] += Elipsoids[nr].ambient[1] * global_a[1];
            pixelcolor[2] += Elipsoids[nr].ambient[2] * global_a[2];
        }
    }
}

int Trace(point p, vector v, int step, float *pixelcolor) {
    float normal_vector[3];
    float reflected_vector[3];
    float inter[3];
    int objectype;

    if (step > MAXstep) {
        return -1; // wykonano wystarczająco zagłębień rekurencji
    }

    int status;
    status = Intersect(p, v, inter, &objectype);

    if (status >= 0) {
        NormalandReflected(status, v, normal_vector, reflected_vector, inter, objectype); // wektor normalny do powierzchni
        // obliczenie kierunku promienia odbitego w punkcie q;
        Phong(status, v, normal_vector, inter, pixelcolor, objectype); //oblicza oświetlenie lokalne wg modelu Phonga
        Trace(inter, reflected_vector, step + 1, pixelcolor);
    }

    return status;
}

void DrawPixels(int x_min, int y_min, int x_max, int y_max)
{
    int status; //status zwracay przez funkcję Trace

    for (int y = y_min; y > y_max; y--) {
        for (int x = x_min; x < x_max; x++) {
            float x_fl, y_fl; // pozycja rysowanego piksela "zmiennoprzecinkowa"
            x_fl = (float) x / (im_size / viewport_size); // przeliczenie pozycji(x,y) w pikselach na pozycję
            y_fl = (float) y / (im_size / viewport_size); // "zmiennoprzecinkową" w oknie obserwatora
            /*************************************************************************************/
            // Parametry "śledzonego" promienia
            float starting_point[] = { x_fl, y_fl, viewport_size }; // punkt, z którego wychodzi promień
            float starting_directions[] = {0.0, 0.0, -1.0}; // wektor opisujący kierunek promienia
            // wyznaczenie początku śledzonego promienia dla rysowanego piksela
            float pixelcolor[] = {0.0, 0.0, 0.0};
            status = Trace(starting_point, starting_directions, 0, pixelcolor);

            if (status == -1) {
                pixelcolor[0] = background[0];
                pixelcolor[1] = background[1];
                pixelcolor[2] = background[2];
            }

            if (status <= -2) {
                pixelcolor[0] = Lights[-status - 2].specular[0];
                pixelcolor[1] = Lights[-status - 2].specular[1];
                pixelcolor[2] = Lights[-status - 2].specular[2];
            }

            // konwersja wartości wyliczonego oświetlenia na liczby od 0 do 255

            if (pixelcolor[0] > 1) { // składowa czerwona R
                pixel[0][0][0] = 255;

            } else {
                pixel[0][0][0] = pixelcolor[0] * 255;
            }

            if (pixelcolor[1] > 1) { // składowa zielona G
                pixel[0][0][1] = 255;

            } else {
                pixel[0][0][1] = pixelcolor[1] * 255;
            }

            if (pixelcolor[2] > 1) { // składowa niebieska B
                pixel[0][0][2] = 255;

            } else {
                pixel[0][0][2] = pixelcolor[2] * 255;
            }

            glRasterPos3f(x_fl, y_fl, 0);
            // inkrementacja pozycji rastrowej dla rysowania piksela
            glDrawPixels(1, 1, GL_RGB, GL_UNSIGNED_BYTE, pixel);
            // Narysowanie kolejnego piksela na ekranie
        }
    }
}

void Display(void) {
    int im_size_2 = im_size / 2;
    glClear(GL_COLOR_BUFFER_BIT);
    // rysowanie pikseli od lewego górnego narożnika do prawego dolnego narożnika
    DrawPixels(-im_size_2, im_size_2, im_size_2, 0);
    DrawPixels(-im_size_2, 0, im_size_2, -im_size_2);
    glFlush();
}

int main(int argc, char **argv) {
    readScene("scene.txt");
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA);
    glutInitWindowSize(im_size, im_size);
    glutCreateWindow("fuckplanets");

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(-viewport_size / 2, viewport_size / 2,
            -viewport_size / 2, viewport_size / 2,
            -viewport_size / 2, viewport_size / 2);
    glMatrixMode(GL_MODELVIEW);

    glutDisplayFunc(Display);
    glutMainLoop();
    return 0;
}


Comments are parsed with GitHub Flavored Markdown

    Write
    Preview

GitHub
Blog | About | Support | Contact | Privacy | Terms of Service
© 2011 GitHub Inc. All rights reserved.
Powered by the Dedicated Servers and
Cloud Computing of Rackspace Hosting®
Dedicated Server
