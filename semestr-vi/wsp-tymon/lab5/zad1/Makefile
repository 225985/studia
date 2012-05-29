all: server client

server: server.c common.h
	cc server.c -o server

client: client.c common.h
	cc client.c -o client

clean:
	rm -f server client *.o

