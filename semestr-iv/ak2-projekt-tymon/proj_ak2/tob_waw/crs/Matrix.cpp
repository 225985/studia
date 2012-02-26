#include "Matrix.h"

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
        
    printf("Alocate some space\n");
    
    // allocate();
    
    vals.reserve(c);
    cols.reserve(c);
    rows.reserve(m+1);
    rows.push_back(0);

    printf("Reading data from file\n");
    read(f, 0);
    rows.push_back(c);

    if (f != stdin) fclose(f);
}

// void Matrix::allocate(){
//     vals = new double[c];
//     cols = new int[c];
//     rows = new int[m+1];
// }

Matrix::~Matrix(){
    // delete[] vals;
    // delete[] cols;
    // delete[] rows;
}

void Matrix::transpose(){
    printf("Transposition (crs -> ccs)\n");
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
        rows_p.push_back(vals_p.size());
    }
    
    vals = vals_p;
    rows = rows_p;
    cols = cols_p;
}

Matrix * Matrix::mul(Matrix * that){
    printf("Starting multiplication\n");
    Matrix * res = new Matrix();
    res->rows.push_back(0);
    res->n = this->n;
    res->m = that->m;
    
    for(unsigned int i=0; i<this->rows.size()-1; i++){
        printf("Processing row %d\n", i);
        for(unsigned int l=0; l<that->rows.size()-1; l++){
            double sum = 0;
            for(int j=this->rows[i]; j<this->rows[i+1]; j++){
                for(int k=that->rows[l]; k<that->rows[l+1]; k++){
                    if(this->cols[j] == that->cols[k]){
                        // printf("sum (%f) += %f * %f\n", sum, this->vals[j], that->vals[k]);
                        sum += this->vals[j]*that->vals[k];
                    }
                }
            }
            if(sum != 0){
                res->vals.push_back(sum);
                res->cols.push_back(l);
                // printf("sum = %f\n", sum);
            }
        }
        res->rows.push_back(res->vals.size());
    }
    
    res->c = res->vals.size();

    return res;
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
            rows.push_back(vals.size()-1);
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
