/*
 * SSO - Lab 6.1
 * Tymon Tobolski 181037
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/sem.h>
#include <pthread.h>

#define PERROR(f, msg) if(f < 0) { perror(msg); exit(1); }
#define SLEEP usleep(rand() % 5000);
#define N 24

#define A 1
#define B 2
#define C 3

#define bool char
#define true 1
#define false 0

#define dbg(str) printf("[%2d / %2d]  %3d => %c (A: \e[1;3%dm%3d\e[0;0m B: \e[1;3%dm%3d\e[0;0m a: %d b: %d) " str "\n", arg->index, i+1, arg->amount, arg->type+64, balance_a < 0 ? 1 : 2, balance_a, balance_b < 0 ? 1 : 2, balance_b, available_a, available_b);

typedef struct {
    int type;
    int amount;
    int index;
} thread_arg;

pthread_t account[2];
pthread_t threads[N];
thread_arg args[N] = {
    {A, -10},
    {B, -20},
    {A, -30},
    {B, -40},
    {A, -50},
    {B, -60},
    {A, 10},
    {B, 20},
    {A, 30},
    {B, 40},
    {A, 150},
    {B, 160},
    {C, 30},
    {C, 20},
    {C, 10},
    {C, 30},
    {C, 20},
    {C, 10},
    {C, -30},
    {C, -20},
    {C, -10},
    {C, -30},
    {C, -20},
    {C, -10}
};

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cond_available_a = PTHREAD_COND_INITIALIZER;
pthread_cond_t cond_available_b = PTHREAD_COND_INITIALIZER;
pthread_cond_t cond_available_ab = PTHREAD_COND_INITIALIZER;

bool available_a = true;
bool available_b = true;
int balance_a = 0;
int balance_b = 0;


void * worker_thread_fun(void * a){
    int i,local_a,local_b;
    thread_arg * arg = (thread_arg *)a;

    for(i=0; i<10; ++i){
        switch(arg->type){
            case A:
                pthread_mutex_lock(&mutex);
                dbg("locked")

                while(!available_a || (balance_a + arg->amount < 0)){
                    dbg("waiting")
                    pthread_cond_wait(&cond_available_a, &mutex);
                }

                available_a = false;

                dbg("unlocked")
                pthread_mutex_unlock(&mutex);

                dbg("transfering")
                local_a = balance_a;
                SLEEP
                balance_a = local_a + arg->amount;

                dbg("done")
                available_a = true;
                if(available_b) pthread_cond_signal(&cond_available_ab);
                pthread_cond_signal(&cond_available_a);

                break;

            case B:
                pthread_mutex_lock(&mutex);
                dbg("locked")

                while(!available_b || (balance_b + arg->amount < 0)){
                    dbg("waiting")
                    pthread_cond_wait(&cond_available_b, &mutex);
                }

                available_b = false;

                dbg("unlocked")
                pthread_mutex_unlock(&mutex);

                dbg("transfering")
                local_b = balance_b;
                SLEEP
                balance_b = local_b + arg->amount;

                dbg("done")
                available_b = true;
                if(available_a) pthread_cond_signal(&cond_available_ab);
                pthread_cond_signal(&cond_available_b);

                break;

            case C:
                pthread_mutex_lock(&mutex);
                dbg("locked")

                while(!available_a || !available_b || (balance_a - arg->amount < 0) || (balance_b + arg->amount < 0)){
                    dbg("waiting")
                    pthread_cond_wait(&cond_available_ab, &mutex);
                }

                available_a = false;
                available_b = false;

                dbg("unlocked")
                pthread_mutex_unlock(&mutex);

                dbg("transfering")

                local_a = balance_a;
                local_b = balance_b;
                SLEEP
                balance_a = local_a - arg->amount;
                balance_b = local_b + arg->amount;

                dbg("done")
                available_a = true;
                available_b = true;

                pthread_cond_signal(&cond_available_ab);
                pthread_cond_signal(&cond_available_a);
                pthread_cond_signal(&cond_available_b);
                break;
        }
    }

    return NULL;
}

int main(int argc, char ** argv){
    int i;

    for(i=0; i<N; ++i){
        args[i].index = i;
        pthread_create(threads + i, NULL, worker_thread_fun, (void *)(args + i));
    }

    for(i=0; i<N; ++i){
        pthread_join(threads[i], NULL);
    }

    printf("\nA = %d  B = %d\n\n", balance_a, balance_b);

    return 0;
}
