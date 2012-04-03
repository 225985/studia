#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <time.h>


struct zapis {
		int begin;
		int end;
		int result;
	};

void main(int argc, char ** args){
    int begin = atoi(args[1]), end = atoi(args[2]), proc = atoi(args[3]);
    int diff = (end - begin) / proc;
    int i, result;
    char b[100], e[100], w[100];
    struct zapis a;
    int sum = 0;
    int fdes, res = 0;
    
    int open_stat = open("db", O_CREAT | O_TRUNC);
    int close_stat = close(open_stat);
    
    time_t tstart, tstop;
    
    time(&tstart);
    for(i=0; i < proc; i++){
        if(fork() == 0) {
            sprintf(w, "%d", i+1);
            sprintf(b, "%d",  i == 0 ? begin + i*diff : begin + i*diff + 1);
            sprintf(e, "%d", i == proc - 1 ? end : (begin + (i+1) * diff));
            execl("./licz", "licz", b, e,w, NULL);
            exit(i+1);
        }
    }

    for (i=0;i<proc;i++) {
        int status;
        int pid = wait(&status);
    }
    time(&tstop);
    
	fdes = open("db", O_RDONLY);
    for(i = 0; i < proc; i++)
    {
        res = read(fdes, &a, sizeof(a));
        if(res < 0)
            perror("Blad odczytu");
        sum += a.result;
    }
    close(fdes);
	printf("Ile liczb pierwszych: %d\n", sum);
	int time = tstop - tstart;
    printf("Czas obliczen: %d sekund\n", time);
}
