void RenderScene(void)
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glutReshapeFunc(ChangeSize);
	glLoadIdentity();
	gluLookAt(viewer[0],viewer[1],viewer[2], 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
	Axes();
	
	if(status == 1)               
	{
		thetax += delta_x * pix2angle; 
		thetay += delta_y * pix2angle;   
	}  
	else if(status ==2)
	{ 
		theta_zoom += delta_zoom*pix2angle; 	
	}

	glRotatef(thetax, 0.0, 1.0, 0.0); 
	glRotatef(thetay, 1.0, 0.0, 0.0); 
	glRotatef(theta_zoom, 0.0, 0.0, 0.0);
	glColor3f(1.0f, 1.0f, 1.0f);

	glutWireTeapot(3.0);
	glFlush();
	glutSwapBuffers();
}