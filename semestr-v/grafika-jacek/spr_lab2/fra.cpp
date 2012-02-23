void drawPoints(float x, float y, float a, int corner, float c1, float c2, float c3, float c4 ){
	
	float c12 = randColor(), c13 = randColor(), c24 = randColor(), c34 = randColor(), cc = randColor();
	float col;
	

	c12 = (1-2*getHalf(a/2))*c12 + getHalf(a/2) * (c1 + c2); 
	c13= (1-2*getHalf(a/2))*c13 + getHalf(a/2) * (c1 + c3); 
	c24 = (1-2*getHalf(a/2))*c24 + getHalf(a/2) * (c4 + c2); 
	c34 = (1-2*getHalf(a/2))*c34 + getHalf(a/2) * (c3 + c4); 
	cc = (1-4*getCenter(a/2))*cc + getCenter(a/2) * (c1 + c2 + c3 + c4); 
	
	if(corner == 1){
		drawPoint(x + a/2, y, c12);
		drawPoint(x, y-a/2, c13);
		drawPoint(x + a/2, y - a/2, cc);
		drawPoint(x + a, y - a/2, c24);
	} else if(corner == 2){
		drawPoint(x + a/2, y, c12);
		drawPoint(x + a/2, y - a/2, cc);
		drawPoint(x + a, y - a/2, c24);
		drawPoint(x + a/2, y - a, c34);
	} else if(corner == 3){
		drawPoint(x + a/2, y, c12);
		drawPoint(x, y-a/2, c13);
		drawPoint(x + a/2, y - a/2, cc);
		drawPoint(x + a/2, y - a, c34);
	} else if(corner == 4){
		drawPoint(x, y-a/2, c13);
		drawPoint(x + a/2, y - a/2, cc);
		drawPoint(x + a, y - a/2, c24);
		drawPoint(x + a/2, y - a, c34);
	} else {
		drawPoint(x + a/2, y, c12);
		drawPoint(x, y-a/2, c13);
		drawPoint(x + a/2, y - a/2, cc);
		drawPoint(x + a, y - a/2, c24);
		drawPoint(x + a/2, y - a, c34);
	}

	if(a > roz){
		drawPoints(x,y,a/2, 1, c1, c12, c13, cc);
		drawPoints(x+a/2,y,a/2, 2, c12, c2, cc, c24);
		drawPoints(x, y-a/2, a/2, 3, c13, cc, c3, c34);
		drawPoints(x+a/2, y - a/2,  a/2,4, cc, c24, c34, c4);
	}
}