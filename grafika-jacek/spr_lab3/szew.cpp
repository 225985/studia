void randCol(){
    for(int i=0; i<N; i++){
        for(int j=0; j<N; j++){
            for(int k=0; k<3; k++){
                col[i][j][k] = (float)rand()/(float)RAND_MAX;
            }
        }
    }
    
    for(int i=0; i<N; i++){
        for(int k=0; k<3; k++){
            col[i][N-1][k] = col[N-i-1][0][k];
        }
    }
}