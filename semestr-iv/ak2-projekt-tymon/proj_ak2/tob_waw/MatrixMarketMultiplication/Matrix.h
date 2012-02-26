#ifndef __MATRIX_H___
#define __MATRIX_H___

#include <stdio.h>
#include <stdlib.h>
#include "mmio.h"

class Matrix {
public:
    Matrix(const char * filename);
    Matrix(int _m, int _n);
    ~Matrix();
    
    void print(int n);
    void saveToFile();
    int fileComparison(const char * filename);
    
    Matrix & operator *(const Matrix & that);

    int m,n;
    MM_typecode matcode;
    double ** data;

protected:
    void allocate();
};

#endif
