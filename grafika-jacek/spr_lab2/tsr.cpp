void drawTriangle(float a, float ax, float ay, int st)
{
	//perturbacje
	float h = a * sqrt(3.0) / 2.0;
	float ax2 = rand() % 1 ? ax + (float)rand()/(float)RAND_MAX*per : ax - (float)rand()/(float)RAND_MAX*per;
	float ay2 = rand() % 1 ? ay + (float)rand()/(float)RAND_MAX*per : ay - (float)rand()/(float)RAND_MAX*per; 
	colorTab c;

	if(st == 0)
	{
		
		glBegin(GL_TRIANGLES);
			randColor(c);
			glColor3fv(c);
			glVertex2f(ax2,ay2);

			randColor(c);
			glColor3fv(c);
			glVertex2f(ax2 - a/2, ay - h);

			randColor(c);
			glColor3fv(c);
			glVertex2f(ax + a/2, ay2 - h);
		glEnd();
	} else {
		drawTriangle(a/2, ax,ay, st-1);
		drawTriangle(a/2, ax-a/4, ay - h/2, st-1);
		drawTriangle(a/2, ax+a/4, ay - h/2, st-1);
	}
}