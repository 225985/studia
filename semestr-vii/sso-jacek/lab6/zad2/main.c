#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/sem.h>
#include <pthread.h>

#define N 18
#define SLEEP usleep(rand() % 1000000);

typedef struct  {
    int amount;
    int id;
} thread_data_t;

pthread_t threads[N];
thread_data_t params[N];
int account1, account2 ;
int acc1 = 1;
int acc2 = 1;


pthread_mutex_t account_mutex = PTHREAD_MUTEX_INITIALIZER;

// zmienna warunkowa odpowiadająca za 1 konto
pthread_cond_t cond_acc1 = PTHREAD_COND_INITIALIZER;
// zmienna warunkowa odpowiadająca za 2 konto
pthread_cond_t cond_acc2 = PTHREAD_COND_INITIALIZER;
// zmienna warunkowa odpowiadająca za oba konto
pthread_cond_t cond_all = PTHREAD_COND_INITIALIZER;


void * acc1op(void *arg){
    thread_data_t * data = (thread_data_t *)arg;
    int amount, id;
    amount = data->amount;
    id = data->id;

    pthread_mutex_lock(&account_mutex);

    while(acc1 == 0 || (account1 + amount < 0)) pthread_cond_wait(&cond_acc1, &account_mutex);

    acc1 = 0;
    printf("[%d] -> %d on account1 \n", id+1, amount);
    pthread_mutex_unlock(&account_mutex);
    SLEEP
    account1 = account1 + amount;

    acc1 = 1;
    pthread_cond_signal(&cond_acc1);
    pthread_cond_signal(&cond_all);

    printf("[%d] account1 : %d after thread %d \n", id+1, account1, id + 1);
    return NULL;
}

void * acc2op(void *arg){
    thread_data_t * data = (thread_data_t *)arg;
    int  amount, id;
    amount = data->amount;
    id = data->id;
    
    pthread_mutex_lock(&account_mutex);
    while( acc2 == 0 || (account2 + amount < 0)) pthread_cond_wait(&cond_acc2, &account_mutex);
    acc2 = 0;
    pthread_mutex_unlock(&account_mutex);

    
    printf("[%d] -> %d on account2 \n", id+1, amount);
    SLEEP
    account2 = account2 + amount;

    acc2 = 1;
    pthread_cond_signal(&cond_acc2);
    pthread_cond_signal(&cond_all);

    printf("[%d] account2 : %d after thread %d \n",id+1, account2, id+1);

    return NULL;
} 

void * betweenop(void *arg){
    thread_data_t * data = (thread_data_t *)arg;
    int amount, id;
    amount = data->amount;
    id = data->id;
    pthread_mutex_lock(&account_mutex);


    while(acc1 == 0 || acc2 == 0 || (account1 + amount < 0) || (account2 - amount < 0)) pthread_cond_wait(&cond_all, &account_mutex);
    
    acc1 = 0;
    acc2 = 0;

    pthread_mutex_unlock(&account_mutex);

    printf("[%d] account 1 ->  account2 : %d \n", id+1, amount);

    SLEEP
    account1 = account1 + amount;
    account2 = account2 - amount;

    acc1 = acc2 = 1;

    printf("[%d] account 1 : %d, account2 : %d after thread %d \n",id+1, account1 ,account2, id+1);
    pthread_cond_signal(&cond_acc1);
    pthread_cond_signal(&cond_acc2);
    pthread_cond_signal(&cond_all);

    return NULL;
}



int main(int argc, char ** argv){
    int i, result;

    account1 = 100;
    account2 = 100;
 
    params[0].id = 0;
    params[0].amount = 300;     
    params[1].id = 1;
    params[1].amount = 300;     
    params[2].id = 2;
    params[2].amount = 300; 

    params[3].id = 3;
    params[3].amount = -100;     
    params[4].id = 4;
    params[4].amount = -100;     
    params[5].id = 5;
    params[5].amount = -100; 

    params[6].id = 6;
    params[6].amount = 300;     
    params[7].id = 7;
    params[7].amount = 300;     
    params[8].id = 8;
    params[8].amount = 300; 

    params[9].id = 9;
    params[9].amount = -150;     
    params[10].id = 10;
    params[10].amount = -150;     
    params[11].id = 11;
    params[11].amount = -150; 

    params[12].id = 12;
    params[12].amount = 100;     
    params[13].id = 13;
    params[13].amount = 100;     
    params[14].id = 14;
    params[14].amount = 100; 

    params[15].id = 15;
    params[15].amount = -100;     
    params[16].id = 16;
    params[16].amount = -100;     
    params[17].id = 17;
    params[17].amount = -100; 


    for(i=0; i<6; i++)
        if((result = pthread_create(&threads[i], NULL, acc1op, &params[i]))){
            printf("Thread %d init error \n", i) ;
        } 

 
    for(i=6; i<12;i++)
        if((result = pthread_create(&threads[i], NULL, acc2op, &params[i]))){
            printf("Thread %d init error \n", i) ;
        } 

    for(i=12;i<18;i++)
        if((result = pthread_create(&threads[i], NULL, betweenop, &params[i]))){
            printf("Thread %d init error \n", i) ;
        } 
    

    for (int i=0; i<N; i++) {
        pthread_join(threads[i], NULL);
    } 

    printf("account1 : %d, account2 %d \n", account1, account2);
    return 0;
}
