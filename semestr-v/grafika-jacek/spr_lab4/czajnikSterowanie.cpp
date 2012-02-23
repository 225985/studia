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