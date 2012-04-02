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

// ./licz BEGIN END N
int main(int argc, char ** argv){
    int begin,end,n,i,sum=0;
    char * filepath;
    FILE *fp;

    if(argc < 5) exit(-1);

    begin = atoi(argv[1]);
    end = atoi(argv[2]);
    n = atoi(argv[3]);
    filepath = argv[4];

    for(i=begin; i<=end; i++){
        if(pierwsza(i)) sum++;
    }

    fp = fopen(filepath, "a");
    lockf(fileno(fp), F_LOCK, -1);
    fseek(fp, 0, SEEK_END);
    fprintf(fp, "%d %d %d %d\n", n, begin, end, sum);
    lockf(fileno(fp), F_ULOCK, -1);
    fclose(fp);

    // printf("Sum %d = %d\n", i, sum);

    _exit(sum);
}


