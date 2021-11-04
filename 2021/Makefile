# This code sets YEAR to the name of the directory the Makefile resides in.
# For .../2003 it will be 2003, for .../2004 it will be 2004.
# For .../Garbage it will be Garbage ...

#YEAR=2003
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
YEAR := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))

PROGRAM=../gen-hpsg-proceedings-xml

FILES=config.pl $(wildcard Includes/*.pdf)


all: hpsg$(YEAR).xml 





hpsg$(YEAR).xml: editors-note.tex conference.txt workshop.txt $(PROGRAM) $(FILES)
	$(PROGRAM)

hpsg$(YEAR).pdf: hpsg$(YEAR).tex 
	chmod 755 *.pdf
	pdflatex hpsg$(YEAR).tex
	pdflatex hpsg$(YEAR).tex



clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.out *.toc *.tmp *~ *.xmpdata *.xmpi

realclean: clean
	rm -f *.pdf *.html *.xml *.shtml *.bib
	mv editors-note.tex editors-note.tex-safe
	rm -f *.tex 
	mv editors-note.tex-safe editors-note.tex
