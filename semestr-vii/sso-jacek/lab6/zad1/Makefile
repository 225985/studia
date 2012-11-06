CC = gcc
CFLAGS = -Wall -ggdb -std=c99 -lrt
BIN = main
OBJ = $(BIN).o

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

test: $(BIN)
	./$(BIN)

clean:
	rm -f $(BIN) *.o
