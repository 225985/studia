#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

void main(int argc, char ** args){
    int i,j;
    int procCount = argc - 2;
    int currProc, procSteps;

    for(i=0; i<procCount; i++) {
        if(fork() == 0) {
            currProc = i + 1;
            procSteps = atoi(args[currProc+1]);
            for(j=0; j<procSteps; j++) {
                printf("Proces %d Krok %d\n", currProc, j);
                sleep(1);
            }
            exit(currProc);
        }
    }

    procSteps = atoi(args[1]);
    for (i=0; i<procSteps; i++) {
        printf("Macierzysty %d\n",i+1);
        sleep(1);
    }

    for (i=0;i<procCount;i++) {
        int status;
        int pid = wait(&status);
        printf("Koniec procesu : pid %d, status %d\n",pid, WEXITSTATUS(status));
    }
}




