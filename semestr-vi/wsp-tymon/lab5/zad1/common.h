#include <arpa/inet.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <dirent.h>

#define BUF_SIZE 256
#define PORT 4567

#define CLOSE 1
#define OPENR 2
#define READ  3
#define OPENW 4
#define WRITE 5
#define OPENDIR 6
#define READDIR 7
#define CLOSEDIR 8

typedef struct {
    int type;
    int fh;
    int num;
    char buf[BUF_SIZE];
} msg_t;

void err(char * emsg){
    perror(emsg);
    exit(1);
}
