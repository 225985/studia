/* Jacek Wieczorek 181043 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


#define COUNT 10

int main(int argc, const char *argv[]){
    int fd1[2], fd2[2];
    int pid, status, res;
    char buffer[255];

    char commands[4][100];

    if(argc < 5) {
        printf("Wrong usage! : ./zad3 cmd1 -par1 cmd2 -par1 \n");
        return -1;
    }


    pipe(fd1);
    pipe(fd2);
    



    if((pid = fork()) == 0){
        close(fd1[0]);
        close(fd2[0]);
        close(fd2[1]);

        printf("Command 1 : %s %s \n", argv[1], argv[2]);
        dup2(fd1[1], 1); // 1 - stdout 

        execlp(argv[1], "cmd1", argv[2], NULL);
        close(fd1[1]);
    }
    
    if((pid = fork()) == 0){
        close(fd1[0]);
        close(fd1[1]);
        close(fd2[1]);

        printf("Command 2 : %s %s\n", argv[3], argv[4]);
        dup2(fd2[0], 0); // 0 - stdin


        execlp(argv[3], "c", argv[4], NULL);
        close(fd2[0]);
    }

    

    close(fd1[1]);
    close(fd2[0]);
    while((res = read(fd1[0], buffer, 255)) != 0){
        write(fd2[1], buffer, res);
    }
    close(fd2[1]);
    close(fd1[0]);

    wait(&status);
    wait(&status);

    return 0;
}