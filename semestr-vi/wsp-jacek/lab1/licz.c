#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char ** args)
{

    int begin = atoi(args[1]), end = atoi(args[2]);
    int count = 0, i;
    for(i=begin; i<=end; i++) {
        if(check(i)){
            count++;
        }
    }
    printf("Proces %d - %d\n", atoi(args[3]), count);
	return count;
}

int check(int n){
    int i,j=0;
    for(i=2;i*i<=n;i++) {
        if(n%i == 0) return(0);
    }
    return(1);
}
