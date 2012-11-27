# SRCS = $(wildcard *.md)
# OBJS = $(SRCS:.md=.tex)

TITLE  = "Projekt inżynierski"
AUTHOR = "Tymon Tobolski (181037)"

POPTS = -N --toc -s \
				-V title=$(TITLE) \
				-V author=$(AUTHOR) \
				-V fontsize=12pt \
				-V lang=polish \
				-V geometry=portrait \
				-V geometry=left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm,headsep=1.2cm \
				-H header.pandoc \
				--highlight-style tango

all: main

main:
	pandoc $(POPTS) -o index.pdf *.md

tex:
	pandoc $(POPTS) -o index.tex *.md

clean:
	rm -rf *.{aux,log,pdf,out,toc,tex}
