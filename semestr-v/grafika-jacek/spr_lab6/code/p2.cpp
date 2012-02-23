void Mouse(int btn, int state, int x, int y)
{
   if(btn==GLUT_LEFT_BUTTON && state == GLUT_DOWN)       
    {
        x_pos_old = x; 
        y_pos_old = y;     
        status = 1;         
    }
	else if(btn==GLUT_RIGHT_BUTTON && state == GLUT_DOWN){
		zoom = y;
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
	delta_zoom = y - zoom;
    zoom = y;

    glutPostRedisplay();    
}