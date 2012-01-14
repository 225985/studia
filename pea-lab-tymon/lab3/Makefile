OPTS  = -optl"-Wl,-read_only_relocs,suppress"
OPTS += -package haskell98
OPTS += -package text
OPTS += -rtsopts
OPTS += -O2
all: main

main: main.hs
	ghc $(OPTS) -o main main.hs

profile: clean
	ghc $(OPTS) -prof -auto-all -o main main.hs
	./main +RTS -p -K64000000 -RTS

clean:
	rm -f main *.hi *.o
