YEAR=2004
all: example.pdf hpsg$(YEAR).xml guidelines.pdf

#all: example.pdf hpsg$(YEAR).xml guidelines.pdf toc.shtml

PROGRAM=../gen-hpsg-proceedings-xml

FILES=config.pl 


example.pdf: example.tex
	xelatex example.tex
	bibtex example
	xelatex example.tex
	xelatex example.tex

guidelines.pdf: guidelines.tex
	xelatex guidelines.tex
	xelatex guidelines.tex

hpsg$(YEAR).xml: editors-note.tex conference.txt $(PROGRAM) $(FILES)
	$(PROGRAM)

hpsg$(YEAR).pdf: hpsg$(YEAR).tex 
	chmod 755 *.pdf
	pdflatex hpsg$(YEAR).tex
	pdflatex hpsg$(YEAR).tex



clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.out *.toc *.tmp *~

realclean: clean
	rm -f *.pdf *.html *.xml *.shtml hpsg$(YEAR)*.tex
	mv editors-note.tex guidelines.tex example.tex example.bib backup/
	rm -f *.tex *.bib
	mv backup/* .
