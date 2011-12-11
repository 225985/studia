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

glLightf(GL_LIGHT0, GL_CONSTANT_ATTENUATION, att_constant);
glLightf(GL_LIGHT0, GL_LINEAR_ATTENUATION, att_linear);
glLightf(GL_LIGHT0, GL_QUADRATIC_ATTENUATION, att_quadratic);

glShadeModel(GL_SMOOTH); 
glEnable(GL_LIGHTING);   
glEnable(GL_LIGHT0);     
glEnable(GL_DEPTH_TEST); 
