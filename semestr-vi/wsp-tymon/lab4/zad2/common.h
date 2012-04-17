#include <semaphore.h>

typedef struct {
    int head;
    int tail;
    int cnt;
    sem_t mutex;
    sem_t empty;
    sem_t full;
    char buf[10][80];
} bufor_t;
