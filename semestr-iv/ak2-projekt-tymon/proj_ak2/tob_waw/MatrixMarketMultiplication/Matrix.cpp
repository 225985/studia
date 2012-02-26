/**
    Matrix manipulation abstract class
    Currently supports only reading from MatrixMarket data file
*/

#include <stdio.h>
#include <stdlib.h>
#include <stdlib.h>
#include "Matrix.h"

Matrix::Matrix(const char * filename){
    FILE *f;
    int nz;
    
    if ((f = fopen(filename, "r")) == NULL) 
        exit(1);
        
    if (mm_read_banner(f, &matcode) != 0){
        printf("Could not process Matrix Market banner.\n");
        exit(1);
    }

    if (mm_is_complex(matcode) && mm_is_matrix(matcode) && mm_is_sparse(matcode)){
        printf("Sorry, this application does not support ");
        printf("Market Market type: [%s]\n", mm_typecode_to_str(matcode));
        exit(1);
    }

    if (mm_read_mtx_crd_size(f, &m, &n, &nz) !=0)
        exit(1);
        
    allocate();

    printf("Reading data from file\n");
    int x,y;
    double v;
    for (int i=0; i<nz; i++){
        fscanf(f, "%d %d %lg\n", &x, &y, &v);
        data[--x][--y] = v;
    }
    
    if (f !=stdin) fclose(f);
}


Matrix::Matrix(int _m, int _n):m(_m),n(_n){
    allocate();
}

Matrix::~Matrix(){
    for(int i=0; i<m; i++){
        delete[] data[i];
    }
    delete[] data;
}

// Print k x k matrix staring at (1,1)
void Matrix::print(int k){
    for (int i=0; i<k; i++){
        for (int j=0; j<k; j++){
            printf("%20.4f ", data[i][j]);
        }
        printf("\n");
    }
}

int Matrix::fileComparison(const char * filename){
FILE *matrix;
FILE *result;
int nz1, nz2, m1, m2, n1, n2;
double data1, data2;
MM_typecode matcode1, matcode2;
if ((matrix = fopen(filename, "r")) == NULL || (result = fopen("multiplied.mtx", "r")) == NULL) exit(1);
if (mm_read_banner(matrix, &matcode1) !=0 || mm_read_banner(result, &matcode2) !=0) {
        printf("Could not process Matrix Market banner.\n");
        exit(1);
    }
if (mm_read_mtx_crd_size(matrix, &m1, &n1, &nz1) !=0)
        exit(1);
if (mm_read_mtx_crd_size(result, &m2, &n2, &nz2) !=0)
        exit(1);
if(nz1!=nz2 || m1!=m2 || n1!=n2){
	printf("Result matrice is different than comparison matrice. :(\n");
        exit(1);
    }

    for (int i=0; i<nz1; i++){
        fscanf(matrix, "%d %d %lg\n", &m1, &n1, &data1);
        fscanf(result, "%d %d %lg\n", &m2, &n2, &data2);
        if(m1!=m2 || n1!=n2 || data1!=data2){
		printf("Result matrice is different than comparison matrice. :(\n");
        	exit(1);
    	}
    }

printf("Result matrice same as comparison matrice. :)\n");
return 0;
}

void Matrix::saveToFile(){
	FILE *f2;
	int nz2=0;

	for(int i=0; i<m; i++){
		for(int j=0; j<n; j++){
			if(data[i][j] != 0) nz2++;
		}
	}

	if ((f2 = fopen("multiplied.mtx", "w")) == NULL){
	    exit(1);
	}
        
	mm_write_banner(f2, matcode);
	mm_write_mtx_crd_size(f2, m, n, nz2);
	
    for(int i=0; i<m; i++){
		for(int j=0; j<n; j++){
			if(data[i][j] != 0) fprintf(f2, "%d %d %10.3g\n", i+1, j+1, data[i][j]);
		}
	}
	
    fclose(f2);
}


void Matrix::allocate(){
    printf("Hardcore malloc: %d x %d\n", m, n);
    
    data = new double*[m];
    for(int i=0; i<m; i++){
        data[i] = new double[n];
        for(int j=0; j<n; j++){
            data[i][j] = 0.0;
        }
    }
    
    printf("Hardcore malloc finished!\n");
}

Matrix & Matrix::operator *(const Matrix & that){
    if(this->n != that.m){
        printf("Matrices size do not match!\n");
        exit(1);
    }

    Matrix * res = new Matrix(that.m, this->n);

    printf("Very stupid matrix multiplication\n");

    // Very stupid matrix multiplication
    for(int x=0; x < that.m; x++){    
        for(int y=0; y < this->n; y++){
            double sum = 0;
            
            for(int i=0; i<this->m; i++){
                sum += this->data[x][i] * that.data[i][y];
            }
            res->data[x][y] = sum;
        }
    }
	res->matcode[0]=matcode[0];
	res->matcode[1]=matcode[1];
	res->matcode[2]=matcode[2];
	res->matcode[3]=matcode[3];
    return *res;
}
