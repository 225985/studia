CC      = g++ -Wall -Os
CXX     = g++ -Wall -Os
OBJECTS  = main.o mmio.o Matrix.o

all: main

.c.o:
	$(CXX) -c $< -o $@

clean:
	rm -f *.o main multiplied.mtx

main: $(OBJECTS)

test: test_stupid test_mcca

test_stupid: all
	time ./main stupid.mtx stupid.mtx
	ruby test.rb stupid.mtx stupid.mtx multiplied.mtx

test_mcca: all
	time ./main mcca.mtx mcca.mtx
	ruby test.rb mcca.mtx mcca.mtx multiplied.mtx
