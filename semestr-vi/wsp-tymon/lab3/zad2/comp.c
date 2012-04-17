#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include "common.h"

int pierwsza(int n){
    int i,j=0;
    for(i=2; i*i<=n; i++){
        if(n%i == 0) return 0;
    }
    return 1;
}

int main(int argc, char ** argv){
    int fd, i, status, wr;
    result_t res;

    res.start = atoi(argv[1]);
    res.stop = atoi(argv[2]);
    res.count = 0;

    for(i=res.start; i<=res.stop; i++){
        if(pierwsza(i)) res.count++;
    }

    fd = open("fifo_arg", O_RDWR);
    PERROR(fd, "open")

    printf("comp %d %d => %d\n", res.start, res.stop, res.count);

    wr = write(fd, &res, sizeof(res));
    PERROR(wr, "write")

    close(fd);
    return res.count;
}
