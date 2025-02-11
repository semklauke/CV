TEX_OPTIONS=-pdflatex=lualatex --synctex=1 --interaction=nonstopmode --file-line-error

.PHONY: default clean

default: main

main:
	latexmk ${TEX_OPTIONS} -pdf main.tex

example:
	latexmk ${TEX_OPTIONS} -pdf example.tex

clean:
	rm -rf *.aux *.dvi *.idx *.ilg *.ind *.out *.toc *.log *.bbl *.blg *~ *.lof *.lot

realclean: clean
	latexmk -c
	rm -rf *.ps *.pdf