all: example.pdf hpsg2012.pdf guidelines.pdf toc.shtml

PROGRAM=~stefan/bin/gen-hpsg-proceedings

example.pdf: example.tex
	pdflatex example.tex
	bibtex example
	pdflatex example.tex
	pdflatex example.tex

guidelines.pdf: guidelines.tex
	pdflatex guidelines.tex
	pdflatex guidelines.tex

hpsg2012.tex: editors-note.tex conference.txt workshop.txt $(PROGRAM)
	gen-hpsg-proceedings

hpsg2012.pdf: hpsg2012.tex
	chmod 755 *.pdf
	pdflatex hpsg2012.tex
	pdflatex hpsg2012.tex


toc.shtml: conference.txt workshop.txt $(PROGRAM)
	gen-hpsg-proceedings


o-public: toc.shtml hpsg2012.pdf 
	rsync -a -e ssh . stefanm@cardinal.stanford.edu:/afs/ir.stanford.edu/group/cslipublications/WWW/cslipublications/HPSG/2012/

html-public: 
	scp -p  *.shtml stefanm@cardinal.stanford.edu:/afs/ir.stanford.edu/group/cslipublications/WWW/cslipublications/HPSG/2012/

clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.out

realclean: clean
	rm -f hpsg2011.pdf
