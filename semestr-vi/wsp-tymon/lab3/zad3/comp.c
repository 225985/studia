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
    int n,fd_arg, fd_res, i, status, wr;
    result_t res;
    arg_t arg;

    n = atoi(argv[1]);

    fd_arg = open("fifo_arg", O_RDWR);
    PERROR(fd_arg, "open arg")
    fd_res = open("fifo_res", O_RDWR);
    PERROR(fd_res, "open res")

    while(1){
        wr = read(fd_arg, &arg, sizeof(arg));
        PERROR(wr, "read")

        if(arg.start == -1) break;

        res.start = arg.start;
        res.stop = arg.stop;
        res.count = 0;
        for(i=arg.start; i<=arg.stop; i++){
            if(pierwsza(i)) res.count++;
        }

        printf("comp %d (%d-%d) => %d \n", n, arg.start, arg.stop, res.count);

        wr = write(fd_res, &res, sizeof(res));
        PERROR(wr, "write")
    }

    close(fd_res);
    close(fd_arg);
    return res.count;
}
