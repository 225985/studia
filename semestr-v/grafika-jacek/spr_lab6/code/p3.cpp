void MyInit(void)
{
	GLbyte *pBytes;
	GLint ImWidth, ImHeight, ImComponents;
	GLenum ImFormat;
	if(which !=2 )
		glEnable(GL_CULL_FACE);
	
	pBytes = LoadTGAImage("C:\\Users\\jacek\\Desktop\\D1_t.tga", &ImWidth, &ImHeight, &ImComponents, &ImFormat);
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
	glShadeModel(GL_SMOOTH); 
    glEnable(GL_LIGHTING);   
    glEnable(GL_LIGHT0);     
    glEnable(GL_DEPTH_TEST); 
}