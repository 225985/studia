all: man comp

man: man.c
	cc -o man man.c

comp: comp.c
	cc -o comp comp.c

clean:
	rm -f *.o man comp

test: all
	./man 5 50 4 5
