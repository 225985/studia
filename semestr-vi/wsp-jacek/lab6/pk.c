#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>

#define N 4
int pocz ,kon,licznik = 0;
char bufor[N][255];
pthread_mutex_t mutex;
pthread_cond_t puste, pelne;

int pk, kk;

void* producent( void* arg ) {
  int num = 0;
  int cnt = 1;
  int prod = 1;
  char str[255];
  num = (int) arg;
  printf("Start producent: %d\n",num);
  while( prod <= pk ) {
    pthread_mutex_lock( &mutex );
    while(licznik >= N)
            pthread_cond_wait(&puste,&mutex);
    sprintf(str, "Producent %d wstawil %d element", num, prod);
    strcpy(bufor[kon], str);
    cnt++;
    kon = (kon+1) %N;
    licznik++;
    prod++;
    pthread_cond_signal(&pelne);
    pthread_mutex_unlock( &mutex );
    printf("%s \n", str);
    sleep( 1 );
  } 
}

void* konsument( void* arg ) {
  int num,x = 0, kon = kk;
  num = (int) arg;
  char str[255];
  printf("Start konsument: %d\n",num);
  while( kon ) {
    pthread_mutex_lock( &mutex );
    while(licznik <=0 )
          pthread_cond_wait(&pelne,&mutex);
    strcpy(str, bufor[pocz]);
    pocz = (pocz+1) %N;
    licznik--;
    kon--;
    pthread_cond_signal(&puste);
    pthread_mutex_unlock( &mutex );
    printf("Kons%d pobral: %s \n", num, str );
    sleep( 1 );
  } 
}


int main( int argc, const char* argv[] ) {
   
    int pc = atoi(argv[1]);
    pk = atoi(argv[2]);
    int kc = atoi(argv[3]);
    kk = atoi(argv[4]);
    int i=0;

    pthread_t * prod;
    pthread_t * kons;

    prod = malloc(sizeof *prod * (pc));
    kons = malloc(sizeof *kons * (kc));

    pthread_mutex_init(&mutex,NULL);
    pthread_cond_init(&puste,NULL);
    pthread_cond_init(&pelne,NULL);

    for(i=0; i<pc; i++) {
        pthread_create(&prod[i], NULL, &producent, (void *)i+1);
    }

    for(i=0; i< kc; i++) {
        pthread_create(&kons[i], NULL, &konsument, (void *)i+1);
    }

    for(i=0; i<pc; i++) {
        pthread_join(prod[i], NULL);
    }

    for(i=0; i< kc; i++) {
        pthread_join(&kons[i], NULL);
    }
    return 0;
}