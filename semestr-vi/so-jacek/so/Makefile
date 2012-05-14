CCFLAGS = -lncurses -pthread

all: main

main: main.cpp
	g++ $(CCFLAGS) main.cpp -o main

test: all
	./main 

clean:
	rm -rf *.o main