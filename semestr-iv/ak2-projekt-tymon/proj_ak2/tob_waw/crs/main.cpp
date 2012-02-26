#include <stdio.h>
#include "Matrix.h"

#define DEBUG 0

int main(int argc, char *argv[]){
    if (argc < 4){
        fprintf(stderr, "Usage: %s [matrix1] [matrix22] [result file]\n", argv[0]);
        exit(1);
    }

    Matrix * m1 = new Matrix(argv[1]);
    Matrix * m2 = new Matrix(argv[2]);
    
    if(DEBUG){
        printf("M1\n");
        m1->print();
        printf("M2\n");
        m2->print();
    }
    
    m2->transpose();
    Matrix * m3 = m1->mul(m2);
    
    if(DEBUG){
        printf("M3\n");
        m3->print();
    }
    m3->saveToFile(argv[3]);

	return 0;
}
