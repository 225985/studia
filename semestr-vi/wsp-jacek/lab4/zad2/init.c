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

	// Utworzenie segmentu ---------------------------
	shm_unlink("bufor");
	
	fd=shm_open("bufor", O_RDWR|O_CREAT , 0774);
	
	if (fd < -0) { perror("open"); exit(-1); }
	printf("fd: %d\n",fd);
	
	size = ftruncate(fd, sizeof(bufor_t));
	if(size < 0) {perror("ftrunc"); exit(-1); }
	

	wbuf = ( bufor_t *)mmap(0,sizeof(bufor_t), PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
	if(wbuf == NULL) {perror("error map"); exit(-1); }
	

	wbuf-> cnt = 0;
	wbuf->head = 0;
	wbuf->tail = 0;

	if(sem_init(&(wbuf->mutex),1,1)){
		perror("mutex");exit(0);
	}
	if(sem_init(&(wbuf->empty),1,BSIZE)) {
		perror("empty"); exit(0);
	}
	if(sem_init(&(wbuf->full),1,0)) {
		perror("full"); exit(0);
	}


	printf("Bufor utworzony\n");
	

	return(0);
}
