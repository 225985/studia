GLfloat mat_ambient[]  = {1.0, 1.0, 1.0, 1.0};        
GLfloat mat_diffuse[]  = {0.8, 0.8, 0.8, 1.0};    
GLfloat mat_specular[] = {0.8, 0.8, 0.8, 1.0};    
GLfloat mat_shininess  = {50.0};

GLfloat light0_ambient[] = {0.0, 0.0, 0.0, 1.0};
GLfloat light0_diffuse[] = {1.0, 1.0, 0.2, 1.0};        
GLfloat light0_specular[]= {1.0, 1.0, 0.2, 1.0}; 

GLfloat light1_ambient[] = {0.0, 0.0, 0.0, 1.0};
GLfloat light1_diffuse[] = {0.2, 0.9, 0.5, 1.0};        
GLfloat light1_specular[]= {0.2, 0.9, 0.5, 1.0};

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

glShadeModel(GL_SMOOTH); 
glEnable(GL_LIGHTING);    
glEnable(GL_LIGHT0);     
glEnable(GL_LIGHT1);     
glEnable(GL_DEPTH_TEST);  