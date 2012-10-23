/*
 * SSO - Lab 4.2
 * Tymon Tobolski 181037
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <termios.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>

#define MPLAYER_START "pause"
#define MPLAYER_NEXT "pt_step 1"
#define MPLAYER_PREV "pt_step -1"

// tty stolen from http://www.cs.uleth.ca/~holzmann/C/system/ttyraw.c

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

int mplayer_fd;
char mplayer_buf[100];

void mplayer_init(char * file){
    mplayer_fd = open(file, O_RDWR);
}

void mplayer_send(char * cmd){
    int r;
    r = sprintf(mplayer_buf, "%s\n", cmd);
    write(mplayer_fd, mplayer_buf, r);
}

int main(int argc, char ** argv){
    int r;
    char c;

    printf("Type [s,n,p,e]: ");
    fflush(stdout);

    if(!isatty(ttyfd)) fatal("not on a tty");
    if(tcgetattr(ttyfd, &orig_termios) < 0) fatal("can't get tty settings");
    if(atexit(tty_reset) != 0) fatal("atexit: can't register tty reset");

    tty_raw();


    if(argc < 2) fatal("Missing fifo file path");

    mplayer_init(argv[1]);


    while(1){
        r = read(0, &c, 1);

        switch(c){
            case 's':
                mplayer_send(MPLAYER_START);
                break;
            case 'p':
                mplayer_send(MPLAYER_PREV);
                break;
            case 'n':
                mplayer_send(MPLAYER_NEXT);
                break;
            case 'e':
                exit(0);
            default:
                printf("Unknown command");
                break;
        }
    }

    return 0;
}
