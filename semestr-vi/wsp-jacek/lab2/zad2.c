#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


int main(int argc, char ** argv){
    int fd1[2], fd2[2], fd3[2];
    int pid;

    int i=0, j = 0, k = 0, l = 0;
    int l1,l2,l3;
    ssize_t res;

    pipe(fd1);
    pipe(fd2);
    pipe(fd3);

    //proces 2
    if(fork() == 0){
        close(fd1[1]);
        close(fd2[0]);
        close(fd3[0]);
        close(fd3[1]);

        while(j < 10){
            res = read(fd1[0], &l2, sizeof(int));
            if(res != 0){
                l2++;
                write(fd2[1], &l2, sizeof(int));
                j++;
            } 
        }
        close(fd1[0]);
        exit(1);
    } 
    
    //proces 3
    if(fork() == 0){
        close(fd1[0]);
        close(fd1[1]);
        close(fd2[1]);
        close(fd3[0]);

        while(k < 10){
            res = read(fd2[0], &l3, sizeof(int));
            if(res != 0){
                l3++;
                write(fd3[1], &l3, sizeof(int));
                k++;
            } 
        }
        close(fd2[0]);
        exit(2);
    } 
    
    
    //proces macierzysty
        close(fd1[0]);
        close(fd2[0]);
        close(fd2[1]);
        close(fd3[1]);
        for(i=1; i<=10; i++){
            printf("P1 -> %d\n", i);
            write(fd1[1], &i, sizeof(int));
        }

        while(l < 10){
            res = read(fd3[0], &l1, sizeof(int));
            if(res != 0){
                printf("P1 <- %d\n", l1);
            } 
            l++;
        }

        close(fd1[1]);
        close(fd3[0]);
    
	
	for (i=0; i<3 ;i++) {
        int status;
        int pid = wait(&status);
    }
}
