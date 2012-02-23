void Mouse(int btn, int state, int x, int y)
{
	if(btn==GLUT_LEFT_BUTTON && state == GLUT_DOWN)       
	{
		x_pos_old = x;        
		y_pos_old = y;                    
		status = 1;          
	}
	else if(btn==GLUT_RIGHT_BUTTON && state == GLUT_DOWN)
	{
		zoom = y;
		status = 2; 
	}
	else
	{
		status = 0;       
	}
}