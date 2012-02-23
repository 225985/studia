class Cell {
public:
    int x, y;
    Cell(int x, int y):x(x),y(y){}
    Cell():x(0),y(0){}
};

int maze_moves[4][2] = {
    {-1, 0},
    {0, -1},
    {0, 1},
    {1, 0}
};


void maze(GLfloat x, GLfloat y, GLfloat size){
    int s = size/MAZE_SIZE;
    x -= size/2;
    y -= size/2;

    for(int i=0; i<MAZE_SIZE; i++){
        for(int j=0; j<MAZE_SIZE; j++){
            grid[i][j] = N | S | E | W;
        }
    }


    stack<Cell *> stk;
    Cell found[4];
    int foundc = 0;
    int total = MAZE_SIZE*MAZE_SIZE;
    int visited = 1;
    Cell * current = new Cell(0,0);

    while(visited < total){
        foundc = 0;
        for(int i=0; i<4; i++){
            int x1 = current->x + maze_moves[i][0];
            int y1 = current->y + maze_moves[i][1];

            if(x1 >= 0 && y1 >= 0 && x1 < MAZE_SIZE && y1 < MAZE_SIZE){
                if(grid[x1][y1] == ALL){
                    found[foundc].x = x1;
                    found[foundc].y = y1;
                    foundc++;
                }
            }
        }

        if(foundc > 0){
            Cell * c = &found[rand() % foundc];
            Cell * one = new Cell(c->x, c->y);
            if(one->x == current->x){
                if(one->y > current->y){
                    grid[one->x][one->y] &= ~N;
                    grid[current->x][current->y] &= ~S;
                } else {
                    grid[one->x][one->y] &= ~S;
                    grid[current->x][current->y] &= ~N;
                }
            } else {
                if(one->x > current->x){
                    grid[one->x][one->y] &= ~W;
                    grid[current->x][current->y] &= ~E;
                } else {
                    grid[one->x][one->y] &= ~E;
                    grid[current->x][current->y] &= ~W;
                }
            }

            stk.push(current);
            current = one;
            visited++;
        } else {
            current = stk.top();
            stk.pop();
        }
    }




    glColor3f(1.0f, 1.0f, 1.0f);
    for(int i=0; i<MAZE_SIZE; i++){
        for(int j=0; j<MAZE_SIZE; j++){
            glRectf(x+i*s, y+j*s, x+(i+1)*s, y+(j+1)*s);
        }
    }

    glColor3f(1.0f, 0.0f, 0.0f);
    glLineWidth(2.0f);

    for(int i=0; i<MAZE_SIZE; i++){
        for(int j=0; j<MAZE_SIZE; j++){

            if(grid[i][j] & N){
                glBegin(GL_LINES);
                glVertex2f(x+i*s, y+j*s);
                glVertex2f(x+(i+1)*s, y+j*s);
                glEnd();
            }

            if(grid[i][j] & S){
                glBegin(GL_LINES);
                glVertex2f(x+i*s, y+(j+1)*s);
                glVertex2f(x+(i+1)*s, y+(j+1)*s);
                glEnd();
            }

            if(grid[i][j] & E){
                glBegin(GL_LINES);
                glVertex2f(x+(i+1)*s, y+j*s);
                glVertex2f(x+(i+1)*s, y+(j+1)*s);
                glEnd();
            }

            if(grid[i][j] & W){
                glBegin(GL_LINES);
                glVertex2f(x+i*s, y+j*s);
                glVertex2f(x+i*s, y+(j+1)*s);
                glEnd();
            }
        }
    }
}
