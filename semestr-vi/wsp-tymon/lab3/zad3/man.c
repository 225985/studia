#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "common.h"

int main(int argc, char ** argv){
    int start, stop, n, fifo_arg, fifo_res, fd_arg, fd_res, i, status,wr,d,res;
    char arg_n[100];
    result_t result;
    arg_t arg;
    int sum=0;

    start = atoi(argv[1]);
    stop = atoi(argv[2]);
    n = atoi(argv[3]);
    d = atoi(argv[4]);

    unlink("fifo_arg");
    unlink("fifo_res");
    fifo_arg = mkfifo("fifo_arg", 0666);
    PERROR(fifo_arg, "mkfifo")
    fifo_res = mkfifo("fifo_res", 0666);
    PERROR(fifo_res, "mkfifo")

    fd_arg = open("fifo_arg", O_RDWR);
    PERROR(fd_arg, "open")
    fd_res = open("fifo_res", O_RDWR);
    PERROR(fd_res, "open")

    for(i=0; i<n; i++){
        if(fork() == 0){
            printf("Starting ./comp %d\n", i);
            sprintf(arg_n, "%d", i);
            execl("./comp", "comp", arg_n, NULL);
            exit(i+1);
        }
    }

    for(i=start; i<stop; i+=d){
        // printf("(%d-%d)\n", i, i+d);
        arg.start = i;
        if(i >= stop-d) arg.stop = stop;
        else arg.stop = i+d-1;

        wr = write(fd_arg, &arg, sizeof(arg));
        PERROR(wr, "write")
    }

    for(i=0; i<n; i++){
        arg.start = arg.stop = -1;
        wr = write(fd_arg, &arg, sizeof(arg));
        PERROR(wr, "write pill")
        wait(&status);
    }

    for(i=start; i<stop; i+=d){
        res = read(fd_res, &result, sizeof(result));
        PERROR(res, "read")
        printf("Res (%d-%d) => %d\n", result.start, result.stop, result.count);
        sum += result.count;
    }


    close(fd_res);
    close(fd_arg);
    printf("\nprime count: %d\n", sum);
}
