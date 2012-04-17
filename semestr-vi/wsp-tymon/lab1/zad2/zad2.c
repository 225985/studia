#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void kroki(int poziom, int k){
    int i;
    for(i=1;i<=k;i++){
        printf("Poziom %d krok %d\n", poziom, i);
        sleep(1);
    }
}

void tworz(int poziom, int k){
    int status;
    if(poziom > 0){
        if(fork() == 0){
            tworz(poziom - 1, k);
            exit(0);
        } else {
            kroki(poziom, k);
        }

        wait(&status);
    } else {
        kroki(poziom, k);
    }
}


int main(int argc, char ** argv){
    int n,k,i,j, pid, status;
    n = atoi(argv[1]);
    k = atoi(argv[2]);

    tworz(n, k);
}
