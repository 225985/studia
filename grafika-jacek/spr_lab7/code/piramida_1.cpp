void keys(unsigned char key, int x, int y)
{
    if(key == 'p') model = 1;
    if(key == 'w') model = 2;
    if(key == 's') model = 3;
	
	if(key == 'z') kk = 0;
	if(key == 'x') kk = 1;
	if(key == 'c') kk = 2;
	if(key == 'v') kk = 3;
	if(key == 'b') kk = 4;
	if(key == 'n') kk = 5;
	if(key == 'm') kk = 6;


    RenderScene(); 
}