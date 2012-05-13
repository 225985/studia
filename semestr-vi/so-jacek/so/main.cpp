#include <ncurses.h>
#include <pthread.h>
#include <sys/time.h>


struct thread_data_t{
  int id;
  int speed;
  int fuel_laps;
  int current_fuel;
} ;

pthread_mutex_t fakeMutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t fakeCond = PTHREAD_COND_INITIALIZER;

pthread_mutex_t mutexRefresh = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mainMutex = PTHREAD_MUTEX_INITIALIZER;

pthread_mutex_t pitstopMutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t pitstopCond = PTHREAD_COND_INITIALIZER;

int lapLength, threadsCount, rc, restCount;
bool pitstop = false;
pthread_t * threads;
thread_data_t * threadsParameters;

void *thread_function(void *arg);
void *main_thread_function(void *arg);
void wait_race(int timeInSec);
void init_threads();
void clear_all();

int main(){
    init_threads();
    clear_all();
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

        wait_race(lapLength / data->speed);
        loops++;
        fuel--;

        if(!pitstop) {
            pthread_mutex_lock(&pitstopMutex);
                pthread_mutex_lock (&mutexRefresh);
                    printw("Thread %d is in  pitstop\n", data->id);
                    refresh();
                pthread_mutex_unlock (&mutexRefresh);
                pitstop = true;
                pthread_cond_signal(&pitstopCond);
                wait_race(5);
                pitstop = false;
                pthread_cond_signal(&pitstopCond);
                fuel = data->fuel_laps;
            pthread_mutex_unlock(&pitstopMutex);
        }

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

void init_threads() {
    initscr();

    printw("Lap length : \n");
    scanw("%d", &lapLength);

    printw("Threads count : \n");
    scanw("%d", &threadsCount);

    threads = new pthread_t[threadsCount];
    threadsParameters = new thread_data_t[threadsCount];

    for(int i=0; i<threadsCount; i++){
        printw("Thread %d speed(1-10) and fuel \n", i);
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
}

void clear_all() {
    for (int i=0; i<threadsCount; i++) {
        pthread_join(threads[i], NULL);
    }
    pthread_mutex_destroy(&mutexRefresh);
    pthread_mutex_destroy(&pitstopMutex);
    pthread_cond_destroy(&pitstopCond);
    pthread_mutex_destroy(&fakeMutex);
    pthread_cond_destroy(&fakeCond);

    delete [] threads;
    delete [] threadsParameters;

    printw("press any key\n");
    getch();
    endwin();
}