SRCS = $(wildcard *.md)
OBJS = $(SRCS:.md=.o)

TITLE  = "Projekt inżynierski"
AUTHOR = "Tymon Tobolski (181037)"

POPTS = -N --toc -s \
				-V title=$(TITLE) \
				-V author=$(AUTHOR) \
				-V fontsize=wide,a4paper,titlepage

all: main

%.o: %.md
	sed 's/^# /\\pagebreak{}\n\n# /g' $< > $@

main: $(OBJS)
	pandoc $(POPTS) -f markdown -o index.pdf *.o

clean:
	rm -rf *.{aux,log,pdf,out,o,tex,toc}
