//x,y - wspó³rzêdne lewego, górnego punktu komory
//ver, hor - opzycja wylosowanych lini poziomych i pionowych liczona od wierzcho³ka (x,y)
//ch, cv ilosc korytarzy mogacych zmiescic sie w danej komorze w pionie i poziomie
void drawMaze(float x, float y, int ver, int hor, int ch, int cv){
	
	int which = rand() % 4;
	
	glBegin(GL_LINES);
	glVertex2f(x , y - ver *w);
	glVertex2f(x + hor * w,y - ver *w);
	glEnd();	

	glBegin(GL_LINES);
	glVertex2f(x + hor * w , y - ver *w);
	glVertex2f(x + ch  * w,  y - ver *w);
	glEnd();

	glBegin(GL_LINES);
	glVertex2f(x + hor*w, y);
	glVertex2f(x + hor*w, y- ver*w);
	glEnd();

	glBegin(GL_LINES);
	glVertex2f(x + hor*w, y- ver*w);
	glVertex2f(x + hor*w, y- cv*w);
	glEnd();

	if(which == 0){
		removeGate(x+hor*w, y, ver, true);
		removeGate(x+hor*w, y-ver*w, ch - hor, false);
		removeGate(x+hor*w, y-ver*w, cv-ver, true);
	}else if(which == 1){
		removeGate(x+hor*w, y-ver*w, ch - hor, false);
		removeGate(x+hor*w, y-ver*w, cv-ver, true);
		removeGate(x, y-ver*w, hor, false);
	}else if(which == 2){
		removeGate(x+hor*w, y-ver*w, cv-ver, true);
		removeGate(x, y-ver*w, hor, false);
		removeGate(x+hor*w, y, ver, true);
	} else {
		removeGate(x, y-ver*w, hor, false);
		removeGate(x+hor*w, y, ver, true);
		removeGate(x+hor*w, y-ver*w, ch - hor, false);
	}
	
	int nh, nv;
	if(hor > 1 && ver > 1){
		nh = randFun(hor);
		nv = randFun(ver);
		drawMaze(x,y,nv,nh,hor,ver);
	}

	if(hor > 1 && (cv - ver) > 1){
		nh = randFun(hor);
		nv = randFun((cv - ver));
		drawMaze(x,y-ver*w,nv,nh,hor,(cv - ver));	
	}

	if((ch-hor) > 1 && ver > 1){
		nh = randFun((ch-hor));
		nv = randFun(ver);
		drawMaze(x + hor*w,y,nv,nh,(ch-hor),ver);
	}

	if((ch-hor) > 1 && (cv - ver) > 1){
		nh = randFun((ch-hor));
		nv = randFun((cv - ver));
		drawMaze(x + hor*w,y-ver*w,nv,nh,(ch-hor),(cv - ver));
	}

}