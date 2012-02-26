#include <stdio.h>
#include <string.h>
#include "Matrix.h"
#include "utils.h"
#include "multipy.h"

#define M_ALL   -1
#define M_SERIAL 0

#ifndef SKIPTBB
    #define M_THREAD_1 1
    #define M_THREAD_2 2
    #define M_SIZE   3
#else
    #define M_SIZE   3
#endif


Matrix * (*functions[M_SIZE])(Matrix *, Matrix *) = {
    multiply_serial,
#ifndef SKIPTBB
    multiply_thread_1,
    multiply_thread_2
#endif
};

char * labels[M_SIZE] = {
    "Serial",
#ifndef SKIPTBB
    "Threaded #1",
    "Threaded #2"
#endif
};

int main(int argc, char *argv[]){
    if (argc < 5){
        fprintf(stderr, "Usage: %s [all|serial|thread1|thread2] [matrix1] [matrix22] [result file]\n", argv[0]);
        exit(1);
    }
    
    int multiplication = -1;

    if(strcmp(argv[1], "all") == 0)         multiplication = M_ALL;
    else if(strcmp(argv[1], "serial") == 0) multiplication = M_SERIAL;
#ifndef SKIPTBB
    else if(strcmp(argv[1], "thread1") == 0) multiplication = M_THREAD_1;
    else if(strcmp(argv[1], "thread2") == 0) multiplication = M_THREAD_2;
#endif
    else {
        fprintf(stderr, "Multiplication '%s' type not found. Supported types: all, serial, thread1, thread2\n", argv[1]);
        exit(1);
    }


    Matrix * m1 = new Matrix(argv[2]);
    Matrix * m2 = new Matrix(argv[3]);
    
    if(MM_DEBUG == 3){
        printf("M1\n");
        m1->print();
        printf("M2\n");
        m2->print();
    }
    
    timer_init();
    
    // Transposition
    timer_start();
    m2->transpose();
    if(MM_DEBUG) printf("Transpose time:    %f\n", timer_end());
    
    
    if(multiplication == M_ALL){
        Matrix * results[M_SIZE];
        
        for(int i=0; i<M_SIZE; i++){
            if(MM_DEBUG) printf("Running %-15s", labels[i]);
            timer_start();
            results[i] = functions[i](m1, m2);
            if(MM_DEBUG) printf("%15f\n", timer_end());
        }
        
        if(MM_DEBUG){
            for(int i=1; i<M_SIZE; i++){
                if(results[i] != NULL && !results[0]->sameAs(results[i])){
                    printf("ERROR: %s matrix different than %s\n", labels[i], labels[0]);
                }
            }
        }
        
    } else {
        if(MM_DEBUG) printf("Running %s\n", labels[multiplication]);
        timer_start();
        Matrix * result = functions[multiplication](m1, m2);
        printf("%f\n", timer_end());
        if(MM_DEBUG && result != NULL) result->saveToFile(argv[4]);
    }

	return 0;
}
