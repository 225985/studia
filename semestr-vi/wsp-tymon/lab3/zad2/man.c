#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "common.h"

int main(int argc, char ** argv){
    int start, stop, n, fifo, fd, i, status,a,b,d,res;
    char args[3][100];
    result_t result;
    int sum=0;

    start = atoi(argv[1]);
    stop = atoi(argv[2]);
    n = atoi(argv[3]);
    d = (stop-start+1) / n;

    unlink("fifo_arg");
    fifo = mkfifo("fifo_arg", 0666);
    PERROR(fifo, "mkfifo")
    fd = open("fifo_arg", O_RDWR);
    PERROR(fd, "open")

    for(i=0; i<n; i++){
        if(fork() == 0){
            a = start + i*d;
            if(i == n-1) b = stop;
            else b = start + (i+1)*d - 1;
            printf("Starting %d ./comp %d %d\n", i, a, b);
            sprintf(args[0], "%d", i+1);
            sprintf(args[1], "%d", a);
            sprintf(args[2], "%d", b);

            execl("./comp", args[0], args[1], args[2], NULL);
            exit(i+1);
        }
    }

    for(i=0; i<n; i++){
        wait(&status);
    }

    for(i=0; i<n; i++){
        res = read(fd, &result, sizeof(result));
        PERROR(res, "read")
        printf("Res %d (%d-%d) => %d\n", i, result.start, result.stop, result.count);
        sum += result.count;
    }

    printf("\nprime count: %d\n", sum);
}
