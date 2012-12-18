
all: main

main:
	pdflatex main.tex
	bibtex main
	pdflatex main.tex
	pdflatex main.tex

arch:
	pdflatex main-arch.tex
	bibtex main-arch
	pdflatex main-arch.tex
	pdflatex main-arch.tex

clean:
	rm *.aux *.bbl *.pandoc *.blg *.log *.out *.toc