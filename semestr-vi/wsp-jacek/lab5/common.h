#define SIZE    512
#define PORT    9950


#define OPENR   1
#define OPENW   2
#define READ    3
#define WRITE   4
#define CLOSE   5
#define OPENDIR 6
#define READDIR 7

typedef struct {
    int typ;
    int fh;
    int ile;
    char buf[SIZE];
} msg_t;