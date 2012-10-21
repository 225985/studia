/* Jacek Wieczorek 181043 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


#define COUNT 10000

int main(int argc, const char *argv[]){
    int fd1[2];
	int pid, status, i;
    char in_buffor[10], out_buffor[10];

	pipe(fd1);

	// create new process
	if((pid = fork()) == 0){
        sleep(3);
        close(fd1[1]);
        for(i=1; i <= COUNT; ++i){
            read(fd1[0], out_buffor, 10);
            printf("P2 <- %s\n", out_buffor);
            sleep(1);
        }
        close(fd1[0]);
    } 

    // main process
    close(fd1[0]);
    for(i=1; i<=COUNT; ++i){
        sprintf(in_buffor, "%d", 10*i);
        printf("P1 -> %s\n", in_buffor);
        write(fd1[1], in_buffor, 10);
    }

    close(fd1[1]);

    wait(&status);
    return 0;
}