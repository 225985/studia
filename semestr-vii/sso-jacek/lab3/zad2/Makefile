CC = gcc
CFLAGS = -Wall -std=c99
ZAD2 = zad2
OBJ1 = $(ZAD2).o


all: $(ZAD2) 

$(ZAD2): $(OBJ1)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

test: $(ZAD2)
	./$(ZAD2)


clean:
	rm -f $(ZAD2) *.o