#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <pthread.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>

#define N 20
#define TYPEA 1
#define TYPEB 2
#define TYPEAB 3
#define SLEEP usleep(rand() % 500000);

typedef struct  {
    int type;
    int amount;
    int id;
} thread_data_t;

pthread_t threads[N];
thread_data_t params[N];
int account1, account2;

pthread_mutex_t account1_mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t account2_mutex = PTHREAD_MUTEX_INITIALIZER;

void * thread_function(void *arg){
    thread_data_t * data = (thread_data_t *)arg;
    int type, amount, id;
    type = data->type;
    amount = data->amount;
    id = data->id;

    switch(type) {
        case TYPEA : {
            pthread_mutex_lock(&account1_mutex);
            printf("Thread type %d : %d, account1 : %d \n", id, amount, account1);
            SLEEP
            account1 += amount;
            printf("account1 : %d after thread %d\n", account1, id);
            pthread_mutex_unlock(&account1_mutex);
            break;
        }

        case TYPEB : {
            pthread_mutex_lock(&account2_mutex);
            printf("Thread type %d : %d, account2 : %d \n", id, amount, account2);
            SLEEP
            account2 += amount;
            printf("account2 : %d after thread %d\n", account1, id);
            pthread_mutex_unlock(&account2_mutex);
            break;
        }

        case TYPEAB : {
            pthread_mutex_lock(&account2_mutex);
            pthread_mutex_lock(&account1_mutex);
            printf("Thread type %d : %d, account1 : %d, account2 : %d \n", id, amount, account1, account2);
            SLEEP
            if(amount > 0){
                account1 -= amount;
                account2 += amount;

            } else {
                account2 -= amount;
                account1 += amount;
            }
            printf("account1 : %d, account2 : %d after thred %d \n", account1, account2, id);
            pthread_mutex_unlock(&account1_mutex);
            pthread_mutex_unlock(&account2_mutex);
            break;
        }
    }
}

int main(int argc, char ** argv){
    int i, result;

    account1 = 100;
    account2 = 100;
 
    for(i=0; i<N; i++){
        if((result = pthread_create(&threads[i], NULL, thread_function, &params[i]))){
            printf("Thread %d init error \n", i) ;
        }        
    }


    for (int i=0; i<N; i++) {
        pthread_join(threads[i], NULL);
    } 


    return 0;
}
