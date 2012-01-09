// glowna funkcja rysujaca
void draw(){
    int  x, y;
    float xf, yf;
    float width_2 = dimensions[0]/2;
    float height_2 = dimensions[1]/2;

    glClear(GL_COLOR_BUFFER_BIT);
    glFlush();


    for (y = height_2; y > -height_2; y--){
        for (x = -width_2; x < width_2; x++){
            xf = (float)x/(dimensions[0]/starting_z);
            yf = (float)y/(dimensions[1]/starting_z);

            starting_point[0] =  xf;
            starting_point[1] =  yf;
            starting_point[2] =  starting_z;

            TRIPLE(color[i] = 0.0);

            trace(starting_point, starting_directions, 1);

            TRIPLE(
                if(color[i] == 0.0) color[i] = background[i];
                pixel[0][0][i] = min(255, color[i] * 255);
            );

            glRasterPos3f(xf, yf, 0);
            glDrawPixels(1, 1, GL_RGB, GL_UNSIGNED_BYTE, pixel);
        }
    }
    glFlush();
}
