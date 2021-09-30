
all: example.pdf guidelines.pdf


example.pdf: example.tex
	xelatex example.tex
	bibtex example
	xelatex example.tex
	xelatex example.tex

guidelines.pdf: guidelines.tex
	xelatex guidelines.tex
	xelatex guidelines.tex
