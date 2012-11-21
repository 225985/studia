# SRCS = $(wildcard *.md)
# OBJS = $(SRCS:.md=.tex)

TITLE  = "Projekt inżynierski"
AUTHOR = "Tymon Tobolski (181037)"

POPTS = -N --toc -s \
				-V title=$(TITLE) \
				-V author=$(AUTHOR) \
				-V fontsize=wide,a4paper,titlepage \
				-V lang=polish \
				-V geometry=portrait \
				-H header.pandoc

all: main

main:
	pandoc $(POPTS) -o index.pdf *.md

tex:
	pandoc $(POPTS) -o index.tex *.md

clean:
	rm -rf *.{aux,log,pdf,out,toc,tex}
