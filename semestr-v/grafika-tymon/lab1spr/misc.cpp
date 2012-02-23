void randomColor(){
    glColor3f(((rand() % 1001) / 1000.0), ((rand() % 1001) / 1000.0), ((rand() % 1001) / 1000.0));
}

GLfloat randp(){
    return ((rand() % 1000) - 500)/ 3000.0;
}