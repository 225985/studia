all: Main

Main: Main.o
	ghc -optl"-Wl,-read_only_relocs,suppress" -package haskell98 -package memoize -o Main Main.o

Main.o: Main.hs
	ghc -c -O2 Main.hs

clean:
	rm -f Main *.hi *.o

# test:
	# time ./main  5
	# time ./main o 5
# time ./main b 6
# time ./main o 6
# time ./main b 8
# time ./main o 8
# time ./main b 9
# time ./main o 9
# time ./main b 10
# time ./main o 10
# time ./main b 11
# time ./main o 11
# time ./main b 12
# time ./main o 12
