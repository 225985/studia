#define SIZE 256

typedef struct {
    int start;
    int stop;
    int count;
} result_t;


#define PERROR(f, msg) if(f < 0) { perror(msg); exit(1); }

