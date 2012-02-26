#include "Matrix.h"
#include <stdio.h>
#include <string.h>
#include "utils.h"

Matrix::Matrix(const char * filename){
    FILE *f;
    
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

    if (mm_read_mtx_crd_size(f, &m, &n, &c) !=0)
        exit(1);
        
    vals.reserve(c);
    cols.reserve(c);
    rows.reserve(m+1);
    rows.push_back(0);

    // if(MM_DEBUG) printf("Reading data from file\n");
    read(f, 0);
    rows.push_back(c);

    if (f != stdin) fclose(f);
}

Matrix::~Matrix(){

}

void Matrix::copyMatcode(Matrix * that){
    memcpy(this->matcode, that->matcode, 4*sizeof(char));
}


void Matrix::transpose(){
    // if(MM_DEBUG) printf("Transposition (crs -> ccs)\n");
    vector<double> vals_p;
    vector<int> cols_p;
    vector<int> rows_p;
    
    vals_p.reserve(vals.size());
    cols_p.reserve(cols.size());
    rows_p.reserve(rows.size());
    
    rows_p.push_back(0);
    for(int i=0; i<m; i++){
        for(int j=0; j<=m; j++){
            for(int k=rows[j]; k<rows[j+1]; k++){
                if(cols[k] == i){
                    vals_p.push_back(vals[k]);
                    cols_p.push_back(j);
                }
            }
        }
        rows_p.push_back((unsigned int)vals_p.size());
    }
    
    vals = vals_p;
    rows = rows_p;
    cols = cols_p;
}

bool Matrix::sameAs(Matrix * that){
    if(this->vals.size() != that->vals.size()) {
        if(MM_DEBUG == 2) printf("vals size: %d <> %d\n", (unsigned int)this->vals.size(), (unsigned int)that->vals.size());
        return false;
    }
    
    if(this->cols.size() != that->cols.size()) {
        if(MM_DEBUG == 2) printf("cols size: %d <> %d\n", (unsigned int)this->cols.size(), (unsigned int)that->cols.size());
        return false;
    }
    
    if(this->rows.size() != that->rows.size()) {
        if(MM_DEBUG == 2) printf("rows size: %d <> %d\n", (unsigned int)this->rows.size(), (unsigned int)that->rows.size());
        return false;
    }
    
    for(size_t i = 0; i<this->vals.size(); i++){
        if(this->vals[i] != that->vals[i]){
            if(MM_DEBUG == 2) printf("vals[%d]: %f <> %f\n", (unsigned int)i, this->vals[i] , that->vals[i]);
            return false;
        }
    }
    
    for(size_t i = 0; i<this->cols.size(); i++){
        if(this->cols[i] != that->cols[i]){ 
            if(MM_DEBUG == 2) printf("cols[%d]: %d <> %d\n", (unsigned int)i, this->cols[i] , that->cols[i]);
            return false;
        }
    }
    
    for(size_t i = 0; i<this->rows.size(); i++){
        if(this->rows[i] != that->rows[i]){
            if(MM_DEBUG == 2) printf("rows[%d]: %d <> %d\n", (unsigned int)i, this->rows[i] , that->rows[i]);
            return false;
        }
    }
    
    return true;
}

void Matrix::read(FILE * f, int py){
    int x,y;
    double v;

    while((int)vals.size() < c){
        fscanf(f, "%d %d %lg\n", &x, &y, &v);

        x--;
        y--;

        vals.push_back(v);
        cols.push_back(x);

        if(y != py){
            rows.push_back((unsigned int)vals.size()-1);
        }

        py = y;
    }
}

void Matrix::print(){
    printf("vals = [");
    for(vector<double>::iterator it=vals.begin(); it!=vals.end(); it++) printf("%f ", *it);
    printf("]\n");
    
    printf("cols = [");
    for(vector<int>::iterator it=cols.begin(); it!=cols.end(); it++) printf("%d ", *it);
    printf("]\n");
    
    printf("rows = [");
    for(vector<int>::iterator it=rows.begin(); it!=rows.end(); it++) printf("%d ", *it);
    printf("]\n");
}

void Matrix::saveToFile(const char * filename){
	FILE *f2;
	if ((f2 = fopen(filename, "w")) == NULL){
	    exit(1);
	}
        
	mm_write_banner(f2, matcode);
	mm_write_mtx_crd_size(f2, n, m, c);
	for(int i=0;i<m;i++){
		for(int j=rows[i];j<rows[i+1];j++){
			fprintf(f2, "%d %d %10.3g\n", cols[j]+1, i+1, vals[j]);
		}
	}
	
    fclose(f2);
}
