all: example.pdf hpsg2009.pdf guidelines.pdf toc.shtml

PROGRAM=~stefan/bin/gen-hpsg-proceedings

example.pdf: example.tex
	pdflatex example.tex
	bibtex example
	pdflatex example.tex
	pdflatex example.tex

guidelines.pdf: guidelines.tex
	pdflatex guidelines.tex
	pdflatex guidelines.tex

hpsg2009.tex: editors-note.tex conference.txt config.pl $(PROGRAM)
	gen-hpsg-proceedings

hpsg2009.pdf: hpsg2009.tex
	chmod 755 *.pdf
	pdflatex hpsg2009.tex
	pdflatex hpsg2009.tex

index.shtml: config.pl $(PROGRAM)
	gen-hpsg-proceedings

toc.shtml: conference.txt  $(PROGRAM)
	gen-hpsg-proceedings


o-public: toc.shtml index.shtml hpsg2009.pdf 
	rsync -a -e ssh . stefanm@cardinal.stanford.edu:/afs/ir.stanford.edu/group/cslipublications/WWW/cslipublications/HPSG/2009/

html-public: 
	scp -p  *.shtml stefanm@turing2.stanford.edu:/afs/ir.stanford.edu/group/cslipublications/WWW/cslipublications/HPSG/2009/

clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.out *.toc

realclean: clean
	rm -f *.pdf *.bib abstr-* hpsg2009.tex
