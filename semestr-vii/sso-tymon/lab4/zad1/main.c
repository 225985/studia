/*
 * SSO - Lab 4.1
 * Tymon Tobolski 181037
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>

#define MODE_READ 0
#define MODE_WRITE 1
#define PERROR(f, msg) if(f < 0) { perror(msg); exit(1); }

int main(int argc, char ** argv){
    int mode = -1;
    int i,r,fd,c;
    int n=10,s=0;
    int t=0;
    char * file;
    char buf[10];

    while ((c = getopt(argc, argv, "rwn:s:")) != -1){
        switch(c){
            case 'r':
                mode = MODE_READ;
                break;

            case 'w':
                mode = MODE_WRITE;
                break;

            case 's':
                s = atoi(optarg);
                break;

            case 'n':
                n = atoi(optarg);
                break;

            default:
                abort();
        }
    }

    file = argv[optind];


    switch(mode){
        case MODE_READ:
            fd = open(file, O_RDONLY);
            PERROR(fd, "open")

            sleep(s);

            while((r = read(fd, buf, 10)) > 0){
                // printf("Read: %d, ", r);
                for(i=0; i<r; i++) printf("%c", buf[i]);
                // printf("\n");
                fflush(stdout);
            }

            close(fd);

            break;

        case MODE_WRITE:
            r = unlink(file);
            // PERROR(r, "unlink")

            r = mkfifo(file, 0666);
            PERROR(r, "mkfifo")

            fd = open(file, O_WRONLY);
            PERROR(fd, "open")

            for(i=0; i<n; i++){
                c = sprintf(buf, "%d\n", i);
                t += c;
                printf("Writing '%d' of len %d. Total: %d\n", i, c,t);
                fflush(stdout);
                r = write(fd, buf, c);
                PERROR(r, "write")
            }

            close(fd);

            break;

        default:
            fprintf(stderr, "Wrong mode\n");
            exit(-1);

    }


    return 0;
}
