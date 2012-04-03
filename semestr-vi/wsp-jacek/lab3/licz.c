#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>

struct zapis {
		int begin;
		int end;
		int result;
	}; 

int main(int argc, char ** args)
{

    int begin = atoi(args[1]), end = atoi(args[2]), proc = atoi(args[3]);
    int count = 0, i;
    struct zapis a;

    
    
    for(i=begin; i<=end; i++) {
        if(check(i)){
            count++;
        }
    }
    
	int open_status = open("db", O_RDWR);

    if(open_status < 0) {
        perror("open error in zad");
        return 0;
    }
	
    a.begin = begin;
    a.end = end;
	a.result = count;

    printf("proc: %d -  %d\n", proc, a.result);

    int write_result = write(open_status, &a, sizeof(a));
    if(write_result < 0) {
        perror("Blad zapisu");
		exit(0);
	}
    close(open_status);
    printf("exit proc %d\n", proc);
	return count;
}

int check(int n){
    int i,j=0;
    for(i=2;i*i<=n;i++) {
        if(n%i == 0) return(0);
    }
    return(1);
}
