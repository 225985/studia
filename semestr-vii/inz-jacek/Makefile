
all: main

main:
	pdflatex main.tex
	bibtex main
	pdflatex main.tex
	pdflatex main.tex

clean:
	rm *.aux *.bbl *.pandoc *.blg *.log *.out *.toc