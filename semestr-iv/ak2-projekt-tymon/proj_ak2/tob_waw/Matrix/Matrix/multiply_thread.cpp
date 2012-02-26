#include "multipy.h"
#include "tbb/tbb.h"

using namespace tbb;

class ThreadedMultiply1 {
    Matrix * const m1;
    Matrix * const m2;
    int stored_i;
    double * const stored_sums;
    
public:
    
    ThreadedMultiply1(Matrix * x, Matrix * y, int i, double * sums):m1(x),m2(y),stored_i(i),stored_sums(sums){}
    
    void operator()(const blocked_range<size_t>& r) const {
        double * sums = stored_sums;
        int i = stored_i;
        
        for(size_t j=r.begin(); j<r.end(); j++){
            sums[j] = 0;
            
            for(int k=m1->rows[i]; k<m1->rows[i+1]; k++){
                for(int l=m2->rows[j]; l<m2->rows[j+1]; l++){
                    if(m1->cols[k] == m2->cols[l]){
                        sums[j] += m1->vals[k]*m2->vals[l];
                    }
                }
            }
        }
        
    }
};

Matrix * multiply_thread_1(Matrix * m1, Matrix * m2){
    Matrix * res = new Matrix();
    res->rows.push_back(0);
    res->n = m1->n;
    res->m = m2->m;
    res->copyMatcode(m1);
    
    size_t m2_rows_size = m2->rows.size()-1;
    size_t m1_rows_size = m1->rows.size()-1;
    
    double * sums = new double[m2_rows_size];
    int * valscount = new int[m1_rows_size];
    
    res->rows.resize(m2_rows_size+1);
    
    for(unsigned int i=0; i<m1_rows_size; i++){
        if(MM_DEBUG == 3) printf("Processing row %d\n", i);
        
        parallel_for(blocked_range<size_t>(0, m2_rows_size), ThreadedMultiply1(m1, m2, i, sums));
        
        valscount[i] = 0;
        for(unsigned int l=0; l<m2_rows_size; l++){
            if(sums[l] != 0){
                valscount[i]++;
                res->vals.push_back(sums[l]);
                res->cols.push_back(l);
            }
        }
    }
    
    int acc = 0;
    for(unsigned int i=0; i<m1_rows_size; i++){
        res->rows[i+1] = acc + valscount[i];
        acc += valscount[i];
    }
    
    
    delete[] sums;
    
    res->c = (unsigned int)res->vals.size();

    return res;
}





class ThreadedMultiply2 {
    Matrix * const m1;
    Matrix * const m2;
    vector<double> * const vals;
    vector<int> * const cols;
    
public:
    
    ThreadedMultiply2(Matrix * x, Matrix * y, vector<double> * vals, vector<int> * cols):
        m1(x), m2(y), vals(vals), cols(cols){}
    
    void operator()(const blocked_range<size_t>& r) const {
        vector<double> * local_vals = vals;
        vector<int> * local_cols = cols;
        
        size_t m2_rows_size = m2->rows.size()-1;
        
        for(size_t i=r.begin(); i<r.end(); i++){
            for(unsigned int j=0; j<m2_rows_size; j++){

                double sum = 0;

                for(int k=m1->rows[i]; k<m1->rows[i+1]; k++){
                    for(int l=m2->rows[j]; l<m2->rows[j+1]; l++){
                        if(m1->cols[k] == m2->cols[l]){
                            sum += m1->vals[k] * m2->vals[l];
                        }
                    }
                }

                if(sum != 0){
                    local_vals[i].push_back(sum);
                    local_cols[i].push_back(j);
                }
            }
        }
        
    }
};

Matrix * multiply_thread_2(Matrix * m1, Matrix * m2){
    Matrix * res = new Matrix();
    res->rows.push_back(0);
    res->n = m1->n;
    res->m = m2->m;
    res->copyMatcode(m1);
    
    size_t m2_rows_size = m2->rows.size()-1;
    size_t m1_rows_size = m1->rows.size()-1;
    
    vector<double> * local_vals = new vector<double>[m1_rows_size];
    vector<int> * local_cols = new vector<int>[m1_rows_size];
    
    res->rows.resize(m2_rows_size+1);
    
    parallel_for(blocked_range<size_t>(0, m1_rows_size), ThreadedMultiply2(m1, m2, local_vals, local_cols));
    
    // (int i, int m2_rows_size, Matrix m1, Matrix m2) => (vector<double> local_vals, vector<int> local_cols)
    // Matrix == (vector<double>, vector<int>, vector<int>)

    // accumulate data from threads
    int acc = 0;
    for(unsigned int i=0; i<m1_rows_size; i++){
        vector<double> * vals = &local_vals[i];
        vector<int> * cols = &local_cols[i];
        
        for(int j=0; j<vals->size(); j++){
            res->vals.push_back((*vals)[j]);
            res->cols.push_back((*cols)[j]);
        }
        
        res->rows[i+1] = acc + vals->size();
        acc += vals->size();
    }
        
    res->c = (unsigned int)res->vals.size();

    return res;
}

