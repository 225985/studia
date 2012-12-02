CC = gcc
CFLAGS = -Wall -ggdb -std=c99
BIN = main
OBJ = $(BIN).o

all: udp_cli udp_serw

udp_cli: udp_cli.c
	$(CC) $(CFLAGS) udp_cli.c -o udp_cli

udp_serw: udp_serw.c
	$(CC) $(CFLAGS) udp_serw.c -o udp_serw

clean:
	rm -f udp_cli udp_serw *.o

