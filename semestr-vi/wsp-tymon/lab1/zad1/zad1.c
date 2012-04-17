#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


int main(int argc, char ** argv){
    int n,k,i,j, pid, status;
    n = atoi(argv[1]);
    k = atoi(argv[2]);

    for(i=1; i<=n; i++){
        if(fork() == 0){
            for(j=1; j<=k; j++){
                printf("Proces %d krok %d\n", i, j);
                sleep(10);
            }
            exit(i);
        }
    }

    for(j=1; j<=k; j++){
        printf("Proces 0 krok %d\n", j);
        sleep(1);
    }

    for(i=1; i<=n; i++){
        pid = wait(&status);
        printf("Koniec procesu %d\n", pid);
    }
}
