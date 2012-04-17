#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define N 10


int main(int argc, char ** argv){
    int fd1[2], fd2[2], fd3[2];
    int pid;
    int i=0;
    int n1,n2,n3;
    ssize_t res1, res2, res3;

    pipe(fd1);
    pipe(fd2);
    pipe(fd3);

    if((pid = fork()) == 0){
        // P2
        close(fd1[1]);
        close(fd2[0]);
        close(fd3[0]);
        close(fd3[1]);

        for(i=1; i<=N; i++){
            read(fd1[0], &n2, sizeof(int));
            printf("P2(%d) got %d\n", getpid(), n2);
            n2++;
            write(fd2[1], &n2, sizeof(int));
        }

        close(fd1[0]);
        close(fd2[1]);
        exit(0);
    } else {
        if((pid = fork()) == 0){
            // P3
            close(fd1[0]);
            close(fd1[1]);
            close(fd2[1]);
            close(fd3[0]);

            for(i=1; i<=N; i++){
                read(fd2[0], &n3, sizeof(int));
                printf("P3(%d) got %d\n", getpid(), n3);
                n3++;
                write(fd3[1], &n3, sizeof(int));
            }
            close(fd2[0]);
            close(fd3[1]);
            exit(0);
        } else {
            // P1
            close(fd1[0]);
            close(fd2[0]);
            close(fd2[1]);
            close(fd3[1]);
            for(i=1; i<=N; i++){
                printf("P1(%d) sent %d\n", getpid(), i);
                write(fd1[1], &i, sizeof(int));
            }

            for(i=1; i<=N; i++){
                read(fd3[0], &n1, sizeof(int));
                printf("P1(%d) got %d\n", getpid(), n1);
            }

            close(fd1[1]);
            close(fd3[0]);
            exit(0);
        }
    }
}
