#include "mpi.h"
#include <stdio.h>
#include "Matrix.h"
#include "utils.h"

#define TAG 1
#define MASTER 0

const int EXIT_CODE = -1;

#define MPILOG_SHORT() printf("node %d (%s): ", rank, name);
#define MPILOG(msg) printf("node %d (%s): %s\n", rank, name, msg);

struct row_result {
    int len;
    double * vals;
    int * cols;
};

int main(int argc, char *argv[]){
    if (argc < 3){
        fprintf(stderr, "Usage: %s [matrix1] [matrix2]\n", argv[0]);
        exit(1);
    }
    
    // MPI Magic
    int rank, size, namelen;
    char name[MPI_MAX_PROCESSOR_NAME];
    MPI::Status stat;
    
    MPI::Init(argc, argv);
    
    size = MPI::COMM_WORLD.Get_size();
    rank = MPI::COMM_WORLD.Get_rank();
    MPI::Get_processor_name(name, namelen);
    
    
    MPILOG("reading mtx files");
    Matrix * m1 = new Matrix(argv[1]);
    Matrix * m2 = new Matrix(argv[2]);
    
    int m1_rows_size = m1->rows.size()-1;
    int m2_rows_size = m2->rows.size()-1;
    
    timer_init();

    if(rank == 0){        
        int row_count = m1_rows_size; //13; //m1->rows.size()-1
        
        // count number of rows per node
        int * rows = new int[size];
        for(int i=0; i<size; i++) rows[i] = 0;
        
        int curr = 1;
        for(int i=0; i<row_count; i++, curr++){
            if(curr >= size) curr = 1;
            rows[curr]++;
        }
        
        timer_start();
        int range[2];
        range[0] = 0;
        for(int i=1; i<size; i++){
            range[1] = rows[i];
            // MPILOG_SHORT();
            // printf("distribute: %d -> (%d, %d)\n", i, range[0], range[1]);
        
            MPI::COMM_WORLD.Send(&range, 2, MPI::INT, i, TAG);
            range[0] += range[1];
        }
        
        MPILOG_SHORT();
        printf("distribution time: %f\n", timer_end());
        
        
        Matrix * res = new Matrix();
        res->rows.push_back(0);
        res->n = m1->n;
        res->m = m2->m;
        res->copyMatcode(m1);
        res->rows.resize(m2_rows_size+1);
        
        row_result * results = new row_result[row_count];

        timer_start();

        // gather data
        for(int i=1; i<size; i++){
            for(int k=0; k<rows[i]; k++){
                int row;
                MPI::COMM_WORLD.Recv(&row, 1, MPI::INT, i, TAG, stat);

                row_result * result = &results[row];

                MPI::COMM_WORLD.Recv(&result->len, 1, MPI::INT, i, TAG, stat);

                result->vals = new double[result->len];
                result->cols = new int[result->len];

                MPI::COMM_WORLD.Recv(result->vals, result->len, MPI::DOUBLE, i, TAG, stat);
                MPI::COMM_WORLD.Recv(result->cols, result->len, MPI::INT, i, TAG, stat);
                
            }
            MPILOG_SHORT();
            printf("got all data from %d\n", i);
        }

        MPILOG_SHORT();
        printf("gathering time: %f\n", timer_end());

        
        // debug disply
        // for(int i=0; i<row_count; i++){
        //     printf("Results[%d]\n", i);
        //     printf("vals = [ ");
        //     for(int j=0; j<results[i].len; j++){
        //         printf("%f, ", results[i].vals[j]);
        //     }
        //     printf(" ]\n");
        //     
        //     printf("cols = [ ");
        //     for(int j=0; j<results[i].len; j++){
        //         printf("%d, ", results[i].cols[j]);
        //     }
        //     printf(" ]\n\n");
        // }
        

        timer_start();
        // accumulate data form nodes
        int acc = 0;
        for(unsigned int i=0; i<m1_rows_size; i++){
            int len = results[i].len;
            double * vals = results[i].vals;
            int * cols = results[i].cols;

            for(int j=0; j<len; j++){
                res->vals.push_back(vals[j]);
                res->cols.push_back(cols[j]);
            }

            res->rows[i+1] = acc + len;
            acc += len;
        }
        
        MPILOG_SHORT();
        printf("data accumulation time: %f\n", timer_end());

        res->c = (unsigned int)res->vals.size();
        res->saveToFile("matrices/_mpi_result.mtx");
    } else {
        // MPILOG("performing transposition");
        timer_start();
        m2->transpose();
        MPILOG_SHORT();
        printf("transposition time: %f\n", timer_end());
        // read messages from master until row_id == -1
        int range[2];
        MPI::COMM_WORLD.Recv(&range, 2, MPI::INT, MASTER, TAG, stat);
            
        // compute!
        int end = range[0] + range[1];
        
        float compute_time;
        float send_time;
        
        MPILOG_SHORT();
        printf("performing row computation (%d - %d)\n", range[0], end);
        
        timer_start();
        
        for(int i=range[0]; i<end; i++){
            
            // MPILOG_SHORT();
            // printf("computing row %d\n", i);
            
        
            vector<double> local_vals;
            vector<int> local_cols;
            
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
                    local_vals.push_back(sum);
                    local_cols.push_back(j);
                }
            }
            
            
            // convert data
            int len = (int)local_vals.size();
            double * plain_vals = &local_vals.front();
            int * plain_cols = &local_cols.front();
            
            // i, len, vals, cols
            MPI::COMM_WORLD.Send(&i,   1, MPI::INT, MASTER, TAG);
            MPI::COMM_WORLD.Send(&len, 1, MPI::INT, MASTER, TAG);
            MPI::COMM_WORLD.Send(plain_vals, len, MPI::DOUBLE, MASTER, TAG);
            MPI::COMM_WORLD.Send(plain_cols, len, MPI::INT, MASTER, TAG);

        }
        
        MPILOG_SHORT();
        printf("computation time: %f\n", timer_end());
    }
    
    MPI::Finalize();
    
	return 0;
}
