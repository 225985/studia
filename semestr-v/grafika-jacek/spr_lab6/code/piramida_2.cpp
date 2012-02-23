if(status == 1)                    // je?li lewy klawisz myszy wci?ni?ty
{
	thetax += delta_x * pix2angle / 30.0;
	thetay += delta_y * pix2angle / 30.0;
}  
else if(status ==2)
{
	theta_zoom += delta_zoom/10.0;
}

if(thetay > 3.1415) 
	thetay -= 2*3.1415;
else if(thetay <= -3.1415) 
	thetay += 2*3.1415;

if(thetay > 3.1415/2 || thetay < -3.1415/2)
{
	p = -1.0;
} 
else
{
p = 1.0;
}


viewer[0] = theta_zoom*cos(thetax)*cos(thetay);
viewer[1] = theta_zoom*sin(thetay);
viewer[2] = theta_zoom*sin(thetax)*cos(thetay);

if(kk == 0) {
	glBegin(GL_QUADS);                           	// draw square
	glTexCoord2f(0.0f, 0.0f);           	// set color to green
	glVertex3f(-5.0f, -5.0f, 5.0f);
	glTexCoord2f(0.0f, 1.0f);            	// set color to white
	glVertex3f( -5.0f, -5.0f, -5.0f);
	glTexCoord2f(1.0f, 1.0f);          	// set color to blue
	glVertex3f( 5.0f, -5.0f, -5.0f);
	glTexCoord2f(1.0f, 0.0f);           	// set color to yellow
	glVertex3f( 5.0f, -5.0f, 5.0f);
	glEnd();
}

if(kk == 1) {
	glBegin(GL_TRIANGLES);     	// draw triangle
	glTexCoord2f(0.0f, 0.0f);
	glVertex3f(  0.0f,  3.0f, 0.0f);
	glTexCoord2f(1.0f, 0.0f);
	glVertex3f(-5.0f, -5.0f, 5.0f);
	glTexCoord2f(0.0f, 1.0f);
	glVertex3f( 5.0f, -5.0f, 5.0f);
	glEnd();
}

if(kk == 2) {
	glBegin(GL_TRIANGLES);
	glTexCoord2f(0.0f, 0.0f);
	glVertex3f(  0.0f,  3.0f, 0.0f);
	glTexCoord2f(1.0f, 0.0f);
	glVertex3f( 5.0f, -5.0f, 5.0f);
	glTexCoord2f(1.0f, 1.0f);
	glVertex3f( 5.0f, -5.0f, -5.0f);
	glEnd();
}

if(kk == 3) {
	glBegin(GL_TRIANGLES);
	glTexCoord2f(0.0f, 0.0f);
	glVertex3f(  0.0f,  3.0f, 0.0f);
	glTexCoord2f(1.0f, 0.0f);
	glVertex3f( -5.0f, -5.0f, -5.0f);
	glTexCoord2f(1.0f, 1.0f);
	glVertex3f(-5.0f, -5.0f, 5.0f);
	glEnd();
}

if(kk == 4) {
	glBegin(GL_TRIANGLES);
	glTexCoord2f(0.0f, 0.0f);
	glVertex3f(  0.0f,  3.0f, 0.0f);
	glTexCoord2f(1.0f, 0.0f);
	glVertex3f( -5.0f, -5.0f, -5.0f);
	glTexCoord2f(1.0f, 1.0f);
	glVertex3f(-5.0f, -5.0f, 5.0f);
	glEnd();	
}

if(kk == 5){
	glBegin(GL_TRIANGLES);
	glTexCoord2f(0.0f, 0.0f);
	glVertex3f(  0.0f,  3.0f, 0.0f);
	glTexCoord2f(1.0f, 0.0f);
	glVertex3f(-5.0f, -5.0f, 5.0f);
	glTexCoord2f(1.0f, 1.0f);
	glVertex3f(-5.0f, -5.0f, 5.0f);
	glEnd();	
}


if(kk == 6) {
	glBegin(GL_TRIANGLE_FAN);     	// draw triangle
	glTexCoord2f(0.0f, 0.0f);
	glVertex3f(  0.0f,  3.0f, 0.0f);
	glTexCoord2f(1.0f, 0.0f);
	glVertex3f(-5.0f, -5.0f, 5.0f);
	glTexCoord2f(0.0f, 1.0f);
	glVertex3f( 5.0f, -5.0f, 5.0f);
	glTexCoord2f(1.0f, 1.0f);
	glVertex3f( 5.0f, -5.0f, -5.0f);
	glTexCoord2f(1.0f, 0.0f);
	glVertex3f( -5.0f, -5.0f, -5.0f);
	glTexCoord2f(0.0f, 1.0f);
	glVertex3f(-5.0f, -5.0f, 5.0f);
	glEnd();



	glBegin(GL_QUADS);                           	// draw square
	glTexCoord2f(0.0f, 0.0f);           	// set color to green
	glVertex3f(-5.0f, -5.0f, 5.0f);
	glTexCoord2f(0.0f, 1.0f);            	// set color to white
	glVertex3f( -5.0f, -5.0f, -5.0f);
	glTexCoord2f(1.0f, 1.0f);          	// set color to blue
	glVertex3f( 5.0f, -5.0f, -5.0f);
	glTexCoord2f(1.0f, 0.0f);           	// set color to yellow
	glVertex3f( 5.0f, -5.0f, 5.0f);
	glEnd();
}
