CC = gcc
CFLAGS = -Wall -std=c99
ZAD1A = zad1a
ZAD1B = zad1b
OBJ1 = $(ZAD1A).o
OBJ2 = $(ZAD1B).o

all: $(ZAD1A) $(ZAD1B)

$(ZAD1A): $(OBJ1)
	$(CC) $(CFLAGS) -o $@ $^

$(ZAD1B): $(OBJ2)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

testa: $(ZAD1A)
	./$(ZAD1A)

testb: $(ZAD1B)
	./$(ZAD1B)


clean:
	rm -f $(ZAD1A) $(ZAD1B) *.o