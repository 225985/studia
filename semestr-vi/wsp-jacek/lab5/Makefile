serv: server.c
	gcc server.c -o server

cli: client.c
	gcc client.c -o client

all: cli serv

rs:
	./server

rc:
	./client 127.0.0.1

clean:
	rm server client
