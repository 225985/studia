#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <signal.h>
#include <errno.h>

#define PERROR(f, msg) if(f < 0) { perror(msg); exit(1); }

#define bool char
#define true 1
#define false 0

