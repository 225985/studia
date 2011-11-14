void fillRandomColors(){
    for(int i=0; i<N; i++){
        for(int j=0; j<N; j++){
            for(int k=0; k<3; k++){
                color[i][j][k] = (rand() % 101)/100.0f;
            }
        }
    }

    // usuniecie "szwu"
    for(int i=0; i<N; i++){
        for(int k=0; k<3; k++){
            color[i][N-1][k] = color[N-i-1][0][k];
        }
    }
}