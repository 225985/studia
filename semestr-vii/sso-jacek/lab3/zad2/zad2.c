/* Jacek Wieczorek 181043 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


#define COUNT 10

int main(int argc, const char *argv[]){
    int fd1[2], fd2[2];
	int pid, status, i, res;
	char buffer[100];

    pipe(fd1);
    pipe(fd2);
    

    if((pid = fork()) == 0){
        close(fd1[0]);
        close(fd2[0]);
        close(fd2[1]);

        printf("ls -l \n");
        dup2(fd1[1], 1); // 1 - stdout 

        execlp("ls", "l", "-l", NULL);
        close(fd1[1]);
    }
    
    if((pid = fork()) == 0){
        close(fd1[0]);
        close(fd1[1]);
        close(fd2[1]);

        printf("cat -n \n");
        dup2(fd2[0], 0); // 0 - stdin


        execlp("cat", "c", "-n", NULL);
        close(fd2[0]);
    }

    

    close(fd1[1]);
    close(fd2[0]);
    while((res = read(fd1[0], buffer, 100)) != 0){
        write(fd2[1], buffer, res);
    }
    close(fd2[1]);
    close(fd1[0]);

    wait(&status);
    wait(&status);

    return 0;
}