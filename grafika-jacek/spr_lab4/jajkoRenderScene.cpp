void RenderScene(void)
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glLoadIdentity();
	gluLookAt(viewer[0],viewer[1],viewer[2], 0.0, 0.0, 0.0, 0.0, p, 0.0);
	Axes();
	if(status == 1)                    
	{
	   thetax += delta_x * pix2angle / 30.0;
	   thetay += delta_y * pix2angle / 30.0;
	   
	}  else if(status ==2){
		theta_zoom += delta_zoom/10.0;
		
	}

	if(thetay > 3.1415) thetay -= 2*3.1415;
        else if(thetay <= -3.1415) thetay += 2*3.1415;


	if(thetay > 3.1415/2 || thetay < -3.1415/2)
	{
		p = -1.0;
	} else
	{
		p = 1.0;
	}
	

	viewer[0] = theta_zoom*cos(thetax)*cos(thetay);
	viewer[1] = theta_zoom*sin(thetay);
	viewer[2] = theta_zoom*sin(thetax)*cos(thetay);

	if(model == 1)
		EggsPoints();
	else if(model == 2)
		EggsMesh();
	else
		EggsTriangles();
	
	glFlush();
	glutSwapBuffers();
}