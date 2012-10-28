
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <termios.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>

static struct termios orig_termios;  /* TERMinal I/O Structure */
static int ttyfd = STDIN_FILENO;

void fatal(char *message){
    fprintf(stderr,"fatal error: %s\n",message);
    exit(1);
}

void tty_reset(void){
    tcsetattr(ttyfd,TCSAFLUSH, &orig_termios);
}

void tty_raw(void) {
    struct termios raw;

    raw = orig_termios;  /* copy original and then modify below */

    /* input modes - clear indicated ones giving: no break, no CR to NL,
       no parity check, no strip char, no start/stop output (sic) control */
    raw.c_iflag &= ~(BRKINT | ICRNL | INPCK | ISTRIP | IXON);

    /* output modes - clear giving: no post processing such as NL to CR+NL */
    raw.c_oflag &= ~(OPOST);

    /* control modes - set 8 bit chars */
    raw.c_cflag |= (CS8);

    /* local modes - clear giving: echoing off, canonical off (no erase with
       backspace, ^U,...),  no extended functions, no signal chars (^Z,^C) */
    raw.c_lflag &= ~(/*ECHO | */ICANON | IEXTEN);

    raw.c_cc[VMIN] = 1;
    raw.c_cc[VTIME] = 0;

    /* put terminal in raw mode after flushing */
    if (tcsetattr(ttyfd, TCSAFLUSH, &raw) < 0) fatal("can't set raw mode");
}

int main(int argc, char ** argv){
    int read_val, fd, r;
    char ch;
    char buffer[100];


    if(!isatty(ttyfd)) fatal("not on a tty");
    if(tcgetattr(ttyfd, &orig_termios) < 0) fatal("can't get tty settings");
    if(atexit(tty_reset) != 0) fatal("atexit: can't register tty reset");
    tty_raw();


    if(argc < 2) {
        perror("./main [path to fifo file]");
        return -1;
    }

    printf("s - start, n - higher speed, p - normal speed, e - exit : ");
    fflush(stdout);

    // init mplayer fifo
    fd = open(argv[1], O_RDWR);

    while(1){
        read_val = read(0, &ch, 1);

        switch(ch){
            case 's':
                r = sprintf(buffer, "%s\n", "pause");
                write(fd, buffer, r);
                break;
            case 'p':
                r = sprintf(buffer, "%s\n", "speed_set 1.0");
                write(fd, buffer, r);
                break;
            case 'n':
                r = sprintf(buffer, "%s\n", "speed_set 10.0");
                write(fd, buffer, r);
                break;
            case 'e':
                return 0;
            default:
                printf("Command not found");
                fflush(stdout);
                break;
        }
    }

    return 0;
}
