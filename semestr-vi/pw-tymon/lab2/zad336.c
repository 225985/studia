// 3.3.6
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int pierwsza(int n){
    int i,j=0;
    for(i=2; i*i <= n; i++){
        if(n % i == 0) return 0;
    }
    return 1;
}

// ./zad336 BEGIN END N
int main(int argc, char ** argv){
    printf("Main!\n");
    int begin,end,n,k,i,sum=0;
    int b,e;
    int pid,status;
    int es;
    char * filepath;
    time_t tm;

    char s1[10];
    char s2[10];
    char s3[10];

    if(argc < 4) exit(-1);
    begin = atoi(argv[1]);
    end = atoi(argv[2]);
    n = atoi(argv[3]);
    filepath = argv[4];

    tm = time(NULL);

    k = (end - begin + 1) / n;

    for(i=0; i<n; i++){
        b = begin + (i*k);
        e = begin + (i+1)*k-1;

        sprintf(s1, "%d", b);
        sprintf(s2, "%d", e);
        sprintf(s3, "%d", i);

        if((pid = fork()) == 0){
            execl("./licz", "licz", s1, s2, s3, filepath, NULL); //, e, i, NULL);
        } else {
            // printf("New process (%s %s %s) pid=%d\n", s1, s2, s3, pid);
            printf("New process %d\n", pid);
        }

    }


    for(i=0; i<n; i++){
        pid = wait(&status);
        es = WEXITSTATUS(status);
        sum += es;
        printf("Process %d finished, status %d\n", pid, es);
    }

    tm = time(NULL) - tm;

    printf("Sum: %d\n", sum);
    printf("Time: %d\n", (int)tm);

    return 0;

}


// N - T
// 1 - 13
// 2 - 8
// 3 - 7
// 4 - 7
// 5 - 6
// 6 - 7
// 7 - 7
