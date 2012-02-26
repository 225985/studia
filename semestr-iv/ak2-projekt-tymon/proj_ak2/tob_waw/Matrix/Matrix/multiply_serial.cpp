#include "multipy.h"

Matrix * multiply_serial(Matrix * m1, Matrix * m2){
    Matrix * res = new Matrix();
    res->rows.push_back(0);
    res->n = m1->n;
    res->m = m2->m;
    res->copyMatcode(m1);
    
    for(unsigned int i=0; i<m1->rows.size()-1; i++){
        if(MM_DEBUG == 3) printf("Processing row %d\n", i);
        for(unsigned int l=0; l<m2->rows.size()-1; l++){
            double sum = 0;
            for(int j=m1->rows[i]; j<m1->rows[i+1]; j++){
                for(int k=m2->rows[l]; k<m2->rows[l+1]; k++){
                    if(m1->cols[j] == m2->cols[k]){
                        sum += m1->vals[j] * m2->vals[k];
                    }
                }
            }
            if(sum != 0){
                res->vals.push_back(sum);
                res->cols.push_back(l);
            }
        }
        res->rows.push_back((unsigned int)res->vals.size());
    }
    
    res->c = (unsigned int)res->vals.size();
    
    return res;
}
