/* Jacek Wieczorek 181043 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


#define COUNT 10

int main(int argc, const char *argv[]){
    int fd1[2];
	int pid, status, i, res, l2, k=0;
	pipe(fd1);

	// create new process
	if((pid = fork()) == 0){
        close(fd1[1]);

        while((res = read(fd1[0], &l2, sizeof(int))) != 0 && k < COUNT){
            printf("P2 <- %d \n", l2);
            k++;
        }
        close(fd1[0]);
        exit(1);
    }

	// main process
    close(fd1[0]);

    for (i = 0; i < COUNT; ++i)
    {   
        printf("P1 -> %d \n", i);
        write(fd1[1], &i, sizeof(int));
    }
    close(fd1[1]);


    wait(&status);
    return 0;
}