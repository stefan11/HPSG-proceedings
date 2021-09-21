all: example.pdf hpsg2003.pdf guidelines.pdf toc.shtml

PROGRAM=~stefan/bin/gen-hpsg-proceedings

example.pdf: example.tex
	pdflatex example.tex
	bibtex example
	pdflatex example.tex
	pdflatex example.tex

guidelines.pdf: guidelines.tex
	pdflatex guidelines.tex
	pdflatex guidelines.tex

hpsg2003.tex: editors-note.tex conference.txt config.pl  $(PROGRAM)
	gen-hpsg-proceedings

hpsg2003.pdf: hpsg2003.tex
	chmod 755 *.pdf
	pdflatex hpsg2003.tex
	pdflatex hpsg2003.tex

index.shtml: config.pl $(PROGRAM)
	gen-hpsg-proceedings

toc.shtml: conference.txt  $(PROGRAM)
	gen-hpsg-proceedings


o-public: toc.shtml index.shtml hpsg2003.pdf 
	kinit --password-file=/Volumes/Verschlüsselt/kinit-file stefanm@stanford.edu
	rsync -a -e ssh . stefanm@cardinal.stanford.edu:/afs/ir.stanford.edu/group/cslipublications/WWW/cslipublications/HPSG/2003/

html-public: 
	scp -p  *.shtml stefanm@turing2.stanford.edu:/turing/u3/www/html-csliweb/publications/HPSG/2003/

clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.out  *.toc

realclean: clean
	rm -f *.pdf *.bib abstr-* hpsg2003.tex
