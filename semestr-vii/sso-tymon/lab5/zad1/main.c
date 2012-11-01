/*
 * SSO - Lab 5.1
 * Tymon Tobolski 181037
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
// #include <semaphore.h>
#include <sys/sem.h>

#define PERROR(f, msg) if(f < 0) { perror(msg); exit(1); }
#define N 5
#define SIZE (sizeof(char) * (N+1))
#define MEM_NAME "mem0"
#define SLEEP usleep(rand() % 500000);

int main(int argc, char ** argv){
    int fd,i,res,status;
    char buf[256];
    char * phs;
    sem_t * forks[N];
    sem_t *fr, *fl;

    shm_unlink(MEM_NAME);

    fd = shm_open(MEM_NAME, O_RDWR | O_CREAT, 0774);
    PERROR(fd, "shm_open")

    res = ftruncate(fd, SIZE);
    PERROR(res, "ftruncate")

    phs = mmap(0, SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    PERROR(phs, "mmap")

    for(i=0; i<N; i++) {
        phs[i] = '#';
        sprintf(buf, "/tmp/sem-%d", i);

        sem_unlink(buf);

        forks[i] = sem_open(buf, O_CREAT, 0774, 1);
        PERROR(res, "sem_init")
    }
    phs[i] = '\0';

    printf("[m] %s\n", phs);

    for(i=0; i<N; i++){
        if(fork() == 0){
            sprintf(buf, "ph %d", i);
            strcpy(argv[0], buf);

            // forks
            if(i == 0) fl = forks[N-1];
            else fl = forks[i-1];
            fr = forks[i];

            SLEEP

            phs[i] = '_';
            printf("[%d] %s started\n", i, phs);

            while(1){
                res = sem_wait(fl);
                PERROR(res, "sem_wait fl");

                phs[i] = '.';
                printf("[%d] %s got left fork\n", i, phs);

                res = sem_wait(fr);
                PERROR(res, "sem_wait fr");

                phs[i] = '.';
                printf("[%d] %s got right fork\n", i, phs);
                fflush(stdout);

                phs[i] = 'E';
                printf("[%d] %s eating\n", i, phs);
                fflush(stdout);

                SLEEP

                phs[i] = '_';
                printf("[%d] %s thinking\n", i, phs);

                res = sem_post(fl);
                PERROR(res, "sem_post fl");
                res = sem_post(fr);
                PERROR(res, "sem_post fr");

                fflush(stdout);

                SLEEP
            }

            exit(0);
        }
    }

    for(i=0; i<N; i++) wait(&status);

    for(i=0; i<N; i++){
        res = sem_close(forks[i]);
        PERROR(res, "sem_close")
        sprintf(buf, "sem-%d", i);
        res = sem_unlink(buf);
        PERROR(res, "sem_unlink")
    }

    return 0;
}
