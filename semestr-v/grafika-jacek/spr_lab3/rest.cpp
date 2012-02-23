void RenderScene(void)
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glLoadIdentity();
    Axes();
	glRotatef(theta[0], 1.0, 0.0, 0.0);
	glRotatef(theta[1], 0.0, 1.0, 0.0);
	glRotatef(theta[2], 0.0, 0.0, 1.0);
	if(model == 1)
		EggsPoints();
	else if(model == 2)
		EggsMesh();
	else
		EggsTriangles();
	
	glFlush();
    glutSwapBuffers();
}

void keys(unsigned char key, int x, int y)
{
    if(key == 'p') model = 1;
    if(key == 'w') model = 2;
    if(key == 's') model = 3;
	RenderScene(); 
}

void spinEgg()
{

    theta[0] -= 0.1;
    if( theta[0] > 360.0 ) theta[0] -= 360.0;

    theta[1] -= 0.1;
    if( theta[1] > 360.0 ) theta[1] -= 360.0;

    theta[2] -= 0.1;
    if( theta[2] > 360.0 ) theta[2] -= 360.0;

    glutPostRedisplay(); 
}