all: zad1 zad2 zad3 zad4

zad1: zad1.c
	gcc -o zad1 zad1.c

zad2: zad2.c pot.c
	gcc -o zad2 zad2.c 
	gcc -o pot pot.c

zad3: zad2.c pot.c
	gcc -o zad3 zad3.c 
	gcc -o pot pot.c

zad4: zad4.c licz.c
	gcc -o zad4 zad4.c
	gcc -o licz licz.c

clean:
	rm zad1 zad2 zad3 zad4 licz pot

