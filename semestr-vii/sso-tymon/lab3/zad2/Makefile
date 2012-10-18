CC = gcc
CFLAGS = -Wall -ggdb -std=c99
BIN = main
OBJ = $(BIN).o

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

test: $(BIN)
	./$(BIN) ls -l -a cat -n

clean:
	rm -f $(BIN) *.o
