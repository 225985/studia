#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

void main(int argc, char ** args){
    int begin = atoi(args[1]), end = atoi(args[2]), proc = atoi(args[3]);
    int diff = (end - begin) / proc;
    int i, result;
    char b[100], e[100], w[100];
    for(i=0; i < proc; i++){
        if(fork() == 0) {
            sprintf(w, "%d", i+1);
            sprintf(b, "%d", begin + i*diff);
            sprintf(e, "%d", (begin + (i+1) * diff) > end ? end : (begin + (i+1) * diff));
            execl("./licz", "licz", b, e,w, NULL);
            exit(i+1);
        }
    }

    for (i=0;i<proc;i++) {
        int status;
        int pid = wait(&status);
        printf("Koniec procesu : pid %d, status %d\n",pid, WEXITSTATUS(status));
    }
}
