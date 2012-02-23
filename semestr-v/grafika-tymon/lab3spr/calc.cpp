void calc(){
    float u = 0.0, v=0.0;

    for(int i=0; i< N; i++){
        u = ((float)i)/(N-1);
        for(int j=0; j<N; j++){
            v = ((float)j)/(N-1);
            tab[i][j][0] = (-90*pow(u, 5.0) + 225*pow(u, 4.0) - 270*pow(u, 3.0) + 180*pow(u, 2.0) - 45*u) * cos(3.14 * v) ;
            tab[i][j][1] =  160*pow(u, 4.0) - 320*pow(u, 3.0) + 160*pow(u, 2.0) - 5.0;
            tab[i][j][2] = (-90*pow(u, 5.0) + 225*pow(u, 4.0) - 270*pow(u, 3.0) + 180*pow(u, 2.0) - 45*u) * sin(3.14 * v);
        }

    }
}