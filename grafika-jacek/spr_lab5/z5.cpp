void Mouse(int btn, int state, int x, int y)
{
	if(btn==GLUT_LEFT_BUTTON && state == GLUT_DOWN)       
    {
        x_pos_old = x;       
        y_pos_old = y;                    
        status = 1;         
    }
	else if(btn==GLUT_RIGHT_BUTTON && state == GLUT_DOWN){
		x_pos_old = x;        
        y_pos_old = y;                    
        status = 2;
	}
	else
        status = 0;         
}

void Motion( GLsizei x, GLsizei y )
{
   
   delta_x= x - x_pos_old;    
	x_pos_old = x;
	delta_y = y - y_pos_old;
	y_pos_old = y;
	
    glutPostRedisplay();    
}


W RenderScene()

if(status == 1)                    
{
	beta[0][0] += delta_x * pix2angle / 30.0;
	beta[0][1] += delta_y * pix2angle / 30.0;
	   
}  else if(status ==2){
	beta[1][0] += delta_x * pix2angle / 30.0;
	beta[1][1] += delta_y * pix2angle / 30.0;
}
	
for(int b=0; b<2; b++){
	light_pos[b][0] = theta_zoom *cos(beta[b][0])*cos(beta[b][1]);
    light_pos[b][1] = theta_zoom *sin(beta[b][1]);
    light_pos[b][2] = theta_zoom *sin(beta[b][0])*cos(beta[b][1]);
}

        
glLightfv(GL_LIGHT0, GL_POSITION, light_pos[0]);
glLightfv(GL_LIGHT1, GL_POSITION, light_pos[1]);