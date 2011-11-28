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
        beta[0] += delta_x/40.0;
        beta[1] += delta_y/40.0;
    } else if(status == 2){
        r += delta_zoom/10.0;
    }

    if(beta[1] >= M_PI) beta[1] -= 2*M_PI;
    else if(beta[1] <= -M_PI) beta[1] += 2*M_PI;

    if(beta[1] > M_PI/2 || beta[1] < -M_PI/2) yp = -1;
    else yp = 1;

    viewer[0] = r*cos(beta[0])*cos(beta[1]);
    viewer[1] = r*sin(beta[1]);
    viewer[2] = r*sin(beta[0])*cos(beta[1]);

    gluLookAt(viewer[0], viewer[1], viewer[2], 0.0, 0.0, 0.0, 0.0, yp, 0.0);

    glRotatef(theta[0], 1.0, 0.0, 0.0);
    glRotatef(theta[1], 0.0, 1.0, 0.0);
    glRotatef(theta[2], 0.0, 0.0, 1.0);

    glColor3f(1.0, 1.0, 1.0);
    egg();

    glFlush();
    glutSwapBuffers();
}

