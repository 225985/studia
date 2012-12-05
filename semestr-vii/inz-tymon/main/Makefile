SRCS = $(wildcard *.md)

POPTS = -N --toc -s \
				-V fontsize=a4paper,onecolumn,oneside,10pt \
				-V lang=polish \
				-V geometry=portrait \
				-H header.pandoc \
				--highlight-style tango

all: index.pdf

index.pdf: title.pdf content.pdf
	gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=index.pdf title.pdf content.pdf

title.pdf: title.tex
	latex --output-format=pdf title.tex

content.pdf: $(SRCS)
	pandoc $(POPTS) -o content.pdf *.md

tex:
	pandoc $(POPTS) -o content.tex *.md

clean:
	rm -rf *.{aux,log,pdf,out,toc,index.tex}

