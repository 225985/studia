/*
 * SSO - Lab 3.1
 * Tymon Tobolski 181037
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, const char *argv[]){
    int fd[2];
    int pid, i, n, status;
    char inbuf[10];
    char outbuf[10];

    if(argc < 2){
        printf("Usage: %s num\n", argv[0]);
        exit(-1);
    }

    n = atoi(argv[1]);

    pipe(fd);

    if((pid = fork()) == 0){
        close(fd[1]);

        for(i=0; i < n; ++i){
            read(fd[0], outbuf, 10);
            printf("[\033[1;31mc\033[0m] Got %s\n", outbuf);
            fflush(stdout);
            sleep(1);
        }

        close(fd[0]);
    } else {
        close(fd[0]);

        for(i=0; i<n; ++i){
            sprintf(inbuf, "%d", 100*i);
            printf("[\033[1;32mp\033[0m] Sending %s\n", inbuf);
            fflush(stdout);
            write(fd[1], inbuf, 10);
        }

        close(fd[1]);
    }

    wait(&status);

    return 0;
}
