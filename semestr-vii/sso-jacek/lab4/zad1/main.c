#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <time.h>
#include <sys/stat.h>

int main(int argc, const char *argv[]){
    char ch;
    while ((ch = getopt(argc, argv, "rwi")) != -1) {
        switch (ch) {
            case 'r' :
                my_read();            
                break;
            case 'w' :
                my_write();
                break;
            case 'i' :
                init();
                break;
            default :
                printf("wrong parameter \n");
        }
    }
    return 0;
}

void init(){
    //create and test fifo file
    unlink("db");
    int create = mkfifo("db", 0666);
    if(create < 0) 
    { 
        perror("fifo file not created"); 
    }
}

void my_write(){
    char text[50] = "testing text";
    int open_status = open("db", O_RDWR);

    if(open_status < 0) {
        perror("open error in write()");
        return 0;
    }

    int write_result = write(open_status, text , 50);
    if(write_result < 0) {
        perror("write to fifo error");
        exit(0);
    }
    close(open_status);
    printf("write text : %s \n", text);
}

void my_read(){
    int fdes, res;
    char text[50];
    fdes = open("db", O_RDWR);
    if(fdes < 0) {
        perror("open error in read()");
        return;
    }
    res = read(fdes, text, 50);
    if(res < 0){
        perror("reading error");
        return;
    }
    printf("read text : %s\n", text);
    close(fdes);
}