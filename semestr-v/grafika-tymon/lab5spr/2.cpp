void init(){
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);

    GLfloat mat_ambient[]  = {1.0, 1.0, 1.0, 1.0};
    GLfloat mat_diffuse[]  = {0.8, 0.8, 0.8, 1.0};
    GLfloat mat_specular[] = {0.8, 0.8, 0.8, 1.0};
    GLfloat mat_shininess  = {50.0};

    GLfloat light0_ambient[] = {0.0, 0.0, 0.0, 1.0};
    GLfloat light0_diffuse[] = {1.0, 0.5, 0.2, 1.0};
    GLfloat light0_specular[]= {1.0, 0.5, 0.2, 1.0};

    // Ustawienie parametrow drugiego zrodla swiatla
    GLfloat light1_ambient[] = {0.0, 0.0, 0.0, 1.0};
    GLfloat light1_diffuse[] = {0.2, 0.5, 1.0, 1.0};
    GLfloat light1_specular[]= {0.2, 0.5, 1.0, 1.0};

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

    glLightf(GL_LIGHT0, GL_CONSTANT_ATTENUATION, att_constant);
    glLightf(GL_LIGHT0, GL_LINEAR_ATTENUATION, att_linear);
    glLightf(GL_LIGHT0, GL_QUADRATIC_ATTENUATION, att_quadratic);

    // Wprowadzenie drugiego zladla swiatla
    glLightfv(GL_LIGHT1, GL_AMBIENT, light1_ambient);
    glLightfv(GL_LIGHT1, GL_DIFFUSE, light1_diffuse);
    glLightfv(GL_LIGHT1, GL_SPECULAR, light1_specular);
    glLightfv(GL_LIGHT1, GL_POSITION, light_pos[1]);

    glLightf(GL_LIGHT1, GL_CONSTANT_ATTENUATION, att_constant);
    glLightf(GL_LIGHT1, GL_LINEAR_ATTENUATION, att_linear);
    glLightf(GL_LIGHT1, GL_QUADRATIC_ATTENUATION, att_quadratic);

    glShadeModel(GL_SMOOTH); // wlaczenie lagodnego cieniowania
    glEnable(GL_LIGHTING);   // wlaczenie systemu oswietlenia sceny
    glEnable(GL_LIGHT0);     // wlaczenie zrodla o numerze 0
    glEnable(GL_LIGHT1);     // wlaczenie zrodla o numerze 1
    glEnable(GL_DEPTH_TEST); // wlaczenie mechanizmu z-bufora
}


// Sterowanie pozycja zrodla swiatla
if(status == 1){
    beta[0][0] += delta_x/40.0;
    beta[0][1] += delta_y/40.0;
} else if(status == 2){
    beta[1][0] += delta_x/40.0;
    beta[1][1] += delta_y/40.0;
}

for(int b=0; b<2; b++){
    if(beta[b][1] >= M_PI) beta[b][1] -= 2*M_PI;
    else if(beta[b][1] <= -M_PI) beta[b][1] += 2*M_PI;

    if(beta[b][1] > M_PI/2 || beta[b][1] < -M_PI/2) yp = -1;
    else yp = 1;

    light_pos[b][0] = r*cos(beta[b][0])*cos(beta[b][1]);
    light_pos[b][1] = r*sin(beta[b][1]);
    light_pos[b][2] = r*sin(beta[b][0])*cos(beta[b][1]);
    cout << "b=" << b << " => " << beta[b][0] << "," << beta[b][1] << "," << beta[b][2] << endl;

}

glLightfv(GL_LIGHT0, GL_POSITION, light_pos[0]);
glLightfv(GL_LIGHT1, GL_POSITION, light_pos[1]);
