CC 		= clang++
CCFLAGS = -lcurl

all: main

main: main.cpp
	$(CC) $(CCFLAGS) main.cpp -o main

test: all
	./main urls.txt

clean:
	rm -rf *.o main
