CCFLAGS = -lrt

all: pk_prod init

pk_prod: pk_prod.c
	cc $(CCFLAGS) pk_prod.c -o pk_prod

init: init.c
	cc $(CCFLAGS) init.c -o init

clean:
	rm -f init pk_prod pk_kons *.o
