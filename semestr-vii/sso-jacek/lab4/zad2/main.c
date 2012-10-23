#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>

#define READ 0
#define WRITE 1


int main(int argc, char ** argv){
    int mode;
    int i,res,fd,c;
    int n,slp, total;
    char buf[10];

    while ((c = getopt(argc, argv, "rw")) != -1){
        switch(c){
            case 'r':
                mode = READ;
                break;

            case 'w':
                mode = WRITE;
                break;

            default:
                abort();
        }
    }

    slp = 5;
    n = 100000;
    total = 0;

    switch(mode){
        case READ:
            fd = open("db", O_RDONLY);
            if(fd < 0) perror("open");
            
            sleep(slp); // sleep red process to send info to buffor

            while((res = read(fd, buf, 10)) != 0){
                for(i=0; i<res; i++) 
                    printf("%c", buf[i]);
                fflush(stdout);
            }

            close(fd);
            break;

        case WRITE:
            res = unlink("db");
            res = mkfifo("db", 0666);
            if(res < 0) perror("write");
            

            fd = open("db", O_WRONLY);
            if(res < 0) perror("write");

            for(i=0; i<n; i++){
                c = sprintf(buf, "%d\n", i);
                total += c;
                printf("Writing '%d' Total: %d\n", i ,total);
                fflush(stdout);
                res = write(fd, buf, c);
                if(res < 0) perror("write");
            }
            close(fd);
            break;

        default:
            printf("Wrong parameter");
            return -1;

    }


    return 0;
}