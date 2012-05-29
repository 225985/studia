#include <pthread.h>
#include <time.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>


typedef struct {
    int begin;
    int end;
    int k;
} msg_t;


pthread_t * threads;
int * results;
int can_read = 0;



pthread_cond_t read_cond = PTHREAD_COND_INITIALIZER;
pthread_mutex_t read_mutex = PTHREAD_MUTEX_INITIALIZER;


int count(int n){
    int i,j=0;
    for(i=2; i*i <= n; i++){
        if(n % i == 0) return 0;
    }
    return 1;
}

void * thread_function(void * arg){
    int i,res;
    msg_t * param = (msg_t *)arg;
    int k, begin, end;
    
    pthread_mutex_lock(&read_mutex);
    k= param->k;
    begin = param->begin;
    end = param-> end;
    can_read = 1;
    pthread_cond_signal(&read_cond);
    pthread_mutex_unlock(&read_mutex);

    printf("Thread %d begin : %d  edn : %d\n", k, begin, end);

    res = 0;
    for(i=begin; i<=end; i++){
        if(count(i)) res++;
    }

    printf("Thread %d found %d\n", k, res);

    pthread_exit((void *)res);
    return NULL;
}

int main(int argc, char const *argv[]){
    int i,d,n,begin,end,b,e,sum,res;
    msg_t msg;

    begin = atoi(argv[1]);
    end = atoi(argv[2]);
    n = atoi(argv[3]);
    d = (end-begin+1) / n;

    threads = (pthread_t *)malloc(sizeof(pthread_t *) * n);
    results = (int *)malloc(sizeof(int) * n);


    for(i=0; i<n; i++){
        pthread_mutex_lock(&read_mutex);

        b = begin + i*d;
        if(i == n-1) 
            e = end;
        else 
            e = begin + (i+1)*d - 1;

        msg.begin = b;
        msg.end = e;
        msg.k = i+1;

        pthread_create(threads + i, NULL, thread_function, &msg);

        
        while(can_read == 0) pthread_cond_wait(&read_cond, &read_mutex);
        can_read = 0;
        pthread_mutex_unlock(&read_mutex);


    }

    sum = 0;

    for(i=0; i<n; i++){
        pthread_join(threads[i], (void **)(results + i));
        sum += results[i];
    }

    printf("Sum: %d\n", sum);

    return 0;
}