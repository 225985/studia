OPTS  = -optl"-Wl,-read_only_relocs,suppress"
OPTS += -package haskell98
OPTS += -package text
OPTS += -rtsopts
OPTS += -O2
all: Main

Main: Main.hs
	ghc $(OPTS) -o Main Main.hs

profile: clean
	ghc $(OPTS) -prof -auto-all -o Main Main.hs
	./Main +RTS -p -K64000000 -RTS

clean:
	rm -f Main *.hi *.o
