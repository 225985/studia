#ifndef __MATRIX_H___
#define __MATRIX_H___

#include <stdio.h>
#include <stdlib.h>
#include <vector>
#include "mmio.h"

using namespace std;

class Matrix {
public:
    Matrix(){};
    Matrix(const char * filename);
    Matrix(int _m, int _n);
    ~Matrix();
    
    Matrix & operator *(const Matrix & that);
    
    void print();
    void saveToFile(const char * filename);
    void transpose();
    Matrix * serialMul(Matrix *);
    Matrix * parallelMul(Matrix *);
    bool sameAs(Matrix *);
    void copyMatcode(Matrix *);

//protected:
    // void allocate();
    void read(FILE * f, int py);
    
    int n,m; // dimensions
    int c;   // number of non-zero values

    // CRS
    vector<double> vals;
    vector<int> cols;
    vector<int> rows;

    MM_typecode matcode;
};

#endif
