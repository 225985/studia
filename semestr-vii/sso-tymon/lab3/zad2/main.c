/*
 * SSO - Lab 3.2
 * Tymon Tobolski 181037
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

#define P "[\033[1;31mp\033[0m] "
#define C1 "[\033[1;32mc1\033[0m] "
#define C2 "[\033[1;33mc2\033[0m] "

int main(int argc, const char *argv[]){
    int fd1[2];
    int fd2[2];
    int pid, i, j, status;
    int res;
    char buf[100];
    const char * cmd[2][100];
    int cmd_c[2];
    int cmd_i = -1;

    if(argc < 3){
        printf("Usage: %s cmd1 [-arg1 -arg2 ...] cmd2 [-arg1 -arg2]\n", argv[0]);
        exit(-1);
    }

    for(i=0; i<2; i++){
        cmd_c[i] = 1;
        for(j=0; j<100; j++) cmd[i][j] = NULL;
    }


    for(i=1; i<argc; i++){
        if(argv[i][0] == '-'){
            if(cmd_i == -1){
                printf("Wrong command: %s\n", argv[i]);
                exit(-1);
            } else {
                cmd[cmd_i][cmd_c[cmd_i]++] = argv[i];
            }
        } else {
            cmd_i++;
            if(cmd_i > 1){
                printf("Too many commands\n");
                exit(-1);
            }
            cmd[cmd_i][0] = argv[i];
        }
    }

    if(cmd[0] == NULL || cmd[1] == NULL){
        printf("Too few commands\n");
        exit(-1);
    }

    pipe(fd1);
    pipe(fd2);

    if((pid = fork()) == 0){
        close(fd1[0]);
        close(fd2[0]);
        close(fd2[1]);

        printf(C1 "Executing");
        for(i=0; i<cmd_c[0]; i++) printf(" %s", cmd[0][i]);
        printf("\n");

        dup2(fd1[1], 1); // Bind stdout to fd1[1]


        execvp(cmd[0][0], &cmd[0][0]);
        // execlp("ls", "l", "-l", NULL);
        perror("execlp");
        close(fd1[1]);
    } else if((pid = fork()) == 0){
        close(fd1[0]);
        close(fd1[1]);
        close(fd2[1]);

        printf(C2 "Executing");
        for(i=0; i<cmd_c[1]; i++) printf(" %s", cmd[1][i]);
        printf("\n");

        dup2(fd2[0], 0); // Bind stdin to fd2[0]


        execvp(cmd[1][0], &cmd[1][0]);
        perror("excelp");
        close(fd2[0]);
    } else {
        close(fd1[1]);
        close(fd2[0]);

        while((res = read(fd1[0], buf, 100)) > 0){
            write(fd2[1], buf, res);
        }

        close(fd2[1]);
        close(fd1[0]);

        wait(&status);
        wait(&status);
    }


    return 0;
}
