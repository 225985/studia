CC = gcc
CFLAGS = -Wall -std=c99
ZAD3 = zad3
OBJ1 = $(ZAD3).o


all: $(ZAD3) 

$(ZAD3): $(OBJ1)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

test: $(ZAD3)
	./$(ZAD3) ls -la cat -n


clean:
	rm -f $(ZAD3) *.o