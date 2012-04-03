#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <time.h>
#include <sys/stat.h>


struct zapis {
		int begin;
		int end;
		int result;
	};

int main(int argc, char ** args){
    int begin = atoi(args[1]), end = atoi(args[2]), proc = atoi(args[3]);
    int diff = (end - begin) / proc;
    int i, result;
    char b[100], e[100], w[100];
    struct zapis a;
    int sum = 0;
    int fdes, res = 0;
    time_t tstart, tstop;

    //create and test fifo file
    unlink("db");
    int create = mkfifo("db", 0666);
    if(create < 0) 
    { 
        perror("fifo file not created"); 
    }
    fdes = open("db", O_RDWR);
    
    //start timer and create proc
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

    //stop proc
    for (i=0;i<proc;i++) {
        int status;
        int pid = wait(&status);
    }
    time(&tstop);
    

    //open fifo file and read
	
    if(fdes < 0) {
        perror("open error in zad");
        return 0;
    }

    for(i = 0; i < proc; i++)
    {
        res = read(fdes, &a, sizeof(a));
        if(res < 0)
            perror("Blad odczytu");
        printf("%d\n", a.result);
        sum += a.result;
    }
    close(fdes);

    //print result
	printf("Ile liczb pierwszych: %d\n", sum);
	int time = tstop - tstart;
    printf("Czas obliczen: %d sekund\n", time);
    return 0;
}
