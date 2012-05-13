#include <ncurses.h>
#include <pthread.h>
#include "common.h"
#include <sys/time.h>


using namespace std;

pthread_mutex_t fakeMutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t fakeCond = PTHREAD_COND_INITIALIZER;

pthread_mutex_t mutexRefresh = PTHREAD_MUTEX_INITIALIZER;


int race_length;

void *thread_function(void *arg);
void wait_race(int timeInSec);

int main(){
    int threadsCount = 0, rc;

    initscr();

    printw("Threads count : \n");
    scanw("%d", &threadsCount);

    pthread_t * threads = new pthread_t[threadsCount];
    thread_data_t * threadsParameters = new thread_data_t[threadsCount];

    for(int i=0; i<threadsCount; i++){
        printw("Thread %d speed and fuel \n", i);
        refresh();
        threadsParameters[i].id = i+1;
        scanw("%d %d", &threadsParameters[i].speed, &threadsParameters[i].fuel_laps);
    }

    clear();

    for(int i=0; i<threadsCount; i++) {
        if((rc = pthread_create(&threads[i], NULL, thread_function, &threadsParameters[i]))){
            printw("Thread %d init error \n", i) ;
        }
    }

    for (int i=0; i<threadsCount; i++) {
        pthread_join(threads[i], NULL);
    }
    pthread_mutex_destroy(&mutexRefresh);


    printw("press any key\n");
    getch();
    endwin();

    delete [] threads;
    delete [] threadsParameters;
    
    return 0;
}

void *thread_function(void *arg) {

    thread_data_t *data = (thread_data_t *)arg;

    pthread_mutex_lock (&mutexRefresh);    
        printw("Thread - id : %d, speed : %d, fuel : %d.\n", data->id, data->speed, data->fuel_laps);
        refresh();
    pthread_mutex_unlock (&mutexRefresh);

    int fuel = data->fuel_laps;
    int loops = 1;
    
    while(fuel > 0){
        pthread_mutex_lock (&mutexRefresh);
            printw("Thread %d start lap %d \n", data->id,loops);
            refresh();
        pthread_mutex_unlock (&mutexRefresh);

        wait_race(data->speed);
        loops++;
        fuel--;
    }

    pthread_mutex_lock (&mutexRefresh);
        printw("Thread %d finished %d laps\n", data->id ,loops-1);
        refresh();
    pthread_mutex_unlock (&mutexRefresh);

    pthread_exit(NULL);
}

void wait_race(int timeInSec)
{
    struct timespec timeToWait;
    struct timeval now;
    int rt;

    gettimeofday(&now,NULL);

    timeToWait.tv_sec = now.tv_sec + timeInSec;
    timeToWait.tv_nsec = now.tv_usec*1000;

    pthread_mutex_lock(&fakeMutex);
    rt = pthread_cond_timedwait(&fakeCond, &fakeMutex, &timeToWait);
    pthread_mutex_unlock(&fakeMutex);
}