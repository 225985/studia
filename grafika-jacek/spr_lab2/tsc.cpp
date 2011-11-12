void ChaosTriangle(){
	float x = 0.0, y = 0.0;
	int t;
	colorTab c;
	x_1 = 0.0f;
	y_1 = at * sqrt(3.0f) / 3.0f;
	x_2 = -at/2;
	y_2 = -at * sqrt(3.0f) / 6.0f;
	x_3 = at/2;
	y_3 = -at * sqrt(3.0f) / 6.0f;
	do{
		x = (((float)rand()/(float)RAND_MAX) * at) - at * 0.5;
		y = (((float)rand()/(float)RAND_MAX) * at*sqrt(3.0)* 0.5) - (at*sqrt(3.0)/6);
	}while(!isInside(x,y));
	for(int i=0; i<100000; i++){
		t = rand() % 3;
		if(t==0){
			x = (x_1 + x) * 0.5;
			y = (y_1 + y) * 0.5; 
		}else if(t==1){
			x = (x_2 + x) * 0.5;
			y = (y_2 + y) * 0.5;
		} else {
			x = (x_3 + x) * 0.5;
			y = (y_3 + y) * 0.5;
		}
		glBegin(GL_POINTS);
			randColor(c);
			glColor3fv(c);
			glVertex2f(x, y);
		glEnd();
	}
}