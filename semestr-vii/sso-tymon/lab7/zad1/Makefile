CC = gcc
CFLAGS = -Wall -ggdb -std=c99 -pthread

all: server client

server: server.o
	$(CC) $(CFLAGS) -o $@ $^

client: client.o
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

test:
	# ./server &
	# ./client

clean:
	rm -f server client *.o


