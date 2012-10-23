CC = gcc
CFLAGS = -Wall -ggdb -std=c99
ZAD = main
OBJ = $(ZAD).o



all: $(ZAD)

$(ZAD): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	rm -f $(ZAD) *.o