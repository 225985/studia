#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <sys/ipc.h> 
#include <sys/sem.h> 



#define SIZE (sizeof(char) * 6)
#define SLEEP usleep(rand() % 500000);
#define SEMINIT 3456 
#define SHARED_MEM "shared_memory_lab5"

int main(int argc, char ** argv){
    int fd,i,result,status, pid;
    char * philosophers;
    struct sembuf operations[2];
    struct sembuf clean[1];
    int forks[5];
    int leftFork, rightFork;

    union semun {
       int              val;    /* Value for SETVAL */
       struct semid_ds *buf;    /* Buffer for IPC_STAT, IPC_SET */
       unsigned short  *array;  /* Array for GETALL, SETALL */
       struct seminfo  *__buf;  /* Buffer for IPC_INFO
                                   (Linux-specific) */
   } argument;

   argument.val = 0;


    shm_unlink(SHARED_MEM);

    fd = shm_open(SHARED_MEM, O_RDWR | O_CREAT, 0774);
    if(fd<0) perror("shm_open");
    result = ftruncate(fd, SIZE);
    if(result < 0) perror("ftruncate");
    philosophers = mmap(0, SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if(philosophers<0) perror("mmap");

    for(i=0; i<5; i++) {
        philosophers[i] = 'i';
        forks[i] = semget(SEMINIT + i, 1, 0666 | IPC_CREAT);
        if(forks[i] < 0) {
            perror("semget");
            exit(0);
        }
        if(semctl(forks[i], 0, SETVAL, argument) < 0) {
            perror("semctl");
            exit(0);
        }
    }

    philosophers[5] = '\0';

    for(i=0; i<5; i++){
        if((pid = fork()) == 0){
            if(i == 4) rightFork = forks[0];
            else rightFork = forks[i+1];

            leftFork = forks[i];
            
            SLEEP
            philosophers[i] = '_';
            printf("%s Philospher%d init\n", philosophers, i+1);

            while(1){
                // wait for 0
                operations[0].sem_num = 0;
                operations[0].sem_op = 0; 
                operations[0].sem_flg = 0;

                // increament by 1
                operations[1].sem_num = 0;
                operations[1].sem_op = 1; 
                operations[1].sem_flg = 0;

                result = semop(rightFork, operations, 2);
                if(result < 0) perror("semop get rf");
                philosophers[i] = '.';
                printf("%s Philosopher %d got right fork\n", philosophers, i+1);
                fflush(stdout);

                result = semop(leftFork, operations, 2);
                if(result < 0) perror("semop get lf");
                printf("%s Philosopher %d got left fork\n", philosophers, i+1);
                fflush(stdout);

                philosophers[i] = 'e';
                printf("%s Philosopher %d is eating\n", philosophers, i+1);
                fflush(stdout);

                SLEEP

                philosophers[i] = '_';
                printf("%s Philosopher %d is full\n", philosophers, i+1);
                fflush(stdout);

                operations[0].sem_num = 0;
                operations[0].sem_op = -1; 
                operations[0].sem_flg = 0;
                result = semop(rightFork, operations, 1);
                if(result < 0) perror("semop leave rf");

                result = semop(leftFork, operations, 1);
                if(result < 0) perror("semop leave lf");

                SLEEP
            }
        } 
    }


    for(i=0; i<5; i++) wait(&status);


    return 0;
}
