#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <mqueue.h>
#include <sys/mman.h>
#include <semaphore.h>

#define BSIZE 4 // Rozmiar bufora
#define LSIZE 80 // Dlugosc linii

typedef struct {
	char buf[BSIZE][LSIZE];
	int head;
	int tail;
	int cnt;
	sem_t mutex;
	sem_t empty;
	sem_t full;
} bufor_t;

int main(int argc, char * argv[]) 
{
	int i,stat,k, pid, size, fd, res, n;
	bufor_t *wbuf ;

	fd=shm_open("bufor", O_RDWR|O_CREAT , 0774);

	// Odwzorowanie segmentu fd w obszar pamieci procesow
	wbuf = ( bufor_t *)mmap(0,sizeof(bufor_t), PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
	if(wbuf == NULL) {perror("map"); exit(-1); }
	printf("Bufor ok\n");

	printf("Producent\n");
	
	for(i=0;i<10;i++) {
		
		sem_wait(&(wbuf->empty));
		sem_wait(&(wbuf->mutex));
		sprintf(wbuf->buf[wbuf->head],"Komunikat %d",i);
		printf("Komunikat %i -> Producent = cnt:%d head: %d tail: %d\n", i, wbuf-> cnt,wbuf->head,wbuf->tail);
		wbuf-> cnt ++;
		wbuf->head = (wbuf->head +1) % BSIZE;
		sem_post(&(wbuf->mutex));
		sem_post(&(wbuf->full));
		sleep(1);
	}
	/*shm_unlink("bufor");
	sem_close(&(wbuf->mutex));
	sem_close(&(wbuf->empty));
	sem_close(&(wbuf->full));*/


	return(0);
}
