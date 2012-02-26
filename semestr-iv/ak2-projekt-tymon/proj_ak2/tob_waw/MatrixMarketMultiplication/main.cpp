#include <stdio.h>
#include "Matrix.h"

int main(int argc, char *argv[]){
    if (argc < 3){
        fprintf(stderr, "Usage: %s [file1] [file2]\n", argv[0]);
        exit(1);
    }

    Matrix m1 = Matrix(argv[1]);
    Matrix m2 = Matrix(argv[2]);
    
    Matrix res = m1 * m2;
    res.saveToFile();
    res.fileComparison("multiplied.mtx"); //Location of matrice with correct results is to be put there

	return 0;
}
