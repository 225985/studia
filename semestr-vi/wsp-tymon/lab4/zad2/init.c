#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>
#include "common.h"


#define NAME "/bufor"

int main(int argc, char const *argv[]){
    int i, stat, fd, size, sv=-1, er;
    bufor_t *wbuf;

    shm_unlink(NAME);

    fd = shm_open(NAME, O_RDWR | O_CREAT, 0774);
    if(fd < 0) {
        perror("open");
        exit(-1);
    }
    printf("fd: %d\n", fd);

    size = ftruncate(fd, sizeof(bufor_t));
    if(size < 0){
        perror("ftrunc");
        exit(-1);
    }

    wbuf = (bufor_t *) mmap(0, sizeof(bufor_t), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if(wbuf == NULL){
        perror("map");
        exit(-1);
    }

    wbuf->head = 0;
    wbuf->tail = 0;
    wbuf->cnt = 0;

    sem_init(&(wbuf->mutex), 1, 1);
    sem_init(&(wbuf->empty), 1, 0);
    sem_init(&(wbuf->full), 1, 10);

    if(fork() == 0){
        sleep(2);
        printf("Producent - start\n");
        for(i=0; i<20; i++){
        	sem_wait(&(wbuf->full));
        	sem_wait(&(wbuf->mutex));
        
        	if(wbuf->head == 10) wbuf->head = 0;
        	if(wbuf->tail == 10) wbuf->tail = 0;
        
        	printf("Producent: %d (head=%d, tail=%d, cnt=%d)\n", i, wbuf->head, wbuf->tail, wbuf->cnt);
            sprintf(wbuf->buf[wbuf->head], "Komunikat %d", i);
            wbuf->head++;
            wbuf->cnt++;

            sem_post(&(wbuf->empty));
            sem_post(&(wbuf->mutex));

            sleep(1);
        }
        shm_unlink(NAME);
        exit(0);
    }

    if(fork() == 0){
        printf("Konsument - start\n");
        for(i=0; i<20; i++){
            sem_wait(&(wbuf->empty));
        	sem_wait(&(wbuf->mutex));
            
            printf("Konsument: %d odebrano %s (head=%d, tail=%d, cnt=%d)\n", i, wbuf->buf[wbuf->tail], wbuf->head, wbuf->tail, wbuf->cnt);
            wbuf->tail++;
            
            wbuf->cnt--;
            sem_post(&(wbuf->full));            
            sem_post(&(wbuf->mutex));
           
            
            sleep(4);
        }
        shm_unlink(NAME);
        exit(0);
    }

    while(wait(&stat) != -1);
    return 0;
}
