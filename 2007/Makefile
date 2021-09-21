all: example.pdf hpsg2007.pdf guidelines.pdf toc.shtml

PROGRAM=~stefan/bin/gen-hpsg-proceedings

example.pdf: example.tex
	pdflatex example.tex
	bibtex example
	pdflatex example.tex
	pdflatex example.tex

guidelines.pdf: guidelines.tex
	pdflatex guidelines.tex
	pdflatex guidelines.tex

hpsg2007.tex: editors-note.tex conference.txt workshop.txt config.pl $(PROGRAM)
	gen-hpsg-proceedings

hpsg2007.pdf: hpsg2007.tex
	chmod 755 *.pdf
	pdflatex hpsg2007.tex
	pdflatex hpsg2007.tex

index.shtml: config.pl $(PROGRAM)
	gen-hpsg-proceedings

toc.shtml: conference.txt  $(PROGRAM)
	gen-hpsg-proceedings


o-public: toc.shtml index.shtml hpsg2007.pdf 
	rsync -a -e ssh . stefanm@cardinal.stanford.edu:/afs/ir.stanford.edu/group/cslipublications/WWW/cslipublications/HPSG/2007/

html-public: 
	scp -p  *.shtml stefanm@turing2.stanford.edu:/afs/ir.stanford.edu/group/cslipublications/WWW/cslipublications/HPSG/2007/

clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.out *.toc

realclean: clean
	rm -f *.pdf *.bib abstr-* hpsg2007.tex
