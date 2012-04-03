#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

void main(int argc, char ** args){
    int i,j;
    int procCount = argc - 2;
    int currProc, procSteps;
    char current[255];

    for(i=0; i< procCount; i++){
        if(fork() == 0) {
            sprintf(current, "./pot %d %d \0", i+1, atoi(args[i+2]));
            system(current);
            exit(i+1);
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
