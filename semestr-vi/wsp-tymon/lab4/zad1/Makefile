all: pk_prod pk_kons init

pk_prod: pk_prod.c
	gcc -lrt pk_prod.c -o pk_prod
	
pk_kons: pk_kons.c
	gcc -lrt pk_kons.c -o pk_kons
	
init: init.c
	gcc -lrt init.c -o init
	
clean:
	rm -f pk_prod pk_kons init *.o
	
