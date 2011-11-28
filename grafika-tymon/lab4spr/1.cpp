void mouse(int btn, int state, int x, int y){
    if(btn == GLUT_LEFT_BUTTON){
        if(state == GLUT_DOWN){
            x_pos_old = x;
            y_pos_old = y;
            status = 1;
        } else {
            status = 0;
        }
    } else if(btn == GLUT_RIGHT_BUTTON){
        if(state == GLUT_DOWN){
            zoom_pos_old = y;
            status = 2;
        } else {
            status = 0;
        }
    }

void motion(GLsizei x, GLsizei y){
    delta_x = x - x_pos_old;
    x_pos_old = x;

    delta_y = y - y_pos_old;
    y_pos_old = y;

    delta_zoom = y - zoom_pos_old;
    zoom_pos_old = y;

    glutPostRedisplay();
}

void draw(){
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glLoadIdentity();

    if(status == 1){
        theta[1] += delta_x*pix2angle;
        theta[0] += delta_y*pix2angle;
    } else if(status == 2){
        viewer[2] += delta_zoom/10.0;
        if(viewer[2] < 0) viewer[2] = 0;
    }

    gluLookAt(viewer[0], viewer[1], viewer[2], 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);

    glRotatef(theta[0], 1.0, 0.0, 0.0);
    glRotatef(theta[1], 0.0, 1.0, 0.0);
    glRotatef(theta[2], 0.0, 0.0, 1.0);

    glColor3f(1.0, 1.0, 1.0);
    glutWireTeapot(3.0);

    glFlush();
    glutSwapBuffers();
}

