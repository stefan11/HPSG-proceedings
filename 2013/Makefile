all: example.pdf hpsg2013.pdf guidelines.pdf toc.shtml

PROGRAM=~stefan/bin/gen-hpsg-proceedings

FILES=Includes/mueller-oersnes.pdf Includes/alotaibi-borsley.pdf Includes/hahn.pdf Includes/ryu.pdf Includes/jin.pdf Includes/miller.pdf


example.pdf: example.tex
	pdflatex example.tex
	bibtex example
	pdflatex example.tex
	pdflatex example.tex

guidelines.pdf: guidelines.tex
	pdflatex guidelines.tex
	pdflatex guidelines.tex

hpsg2013.tex: editors-note.tex conference.txt workshop.txt $(PROGRAM) $(FILES)
	gen-hpsg-proceedings

hpsg2013.pdf: hpsg2013.tex 
	chmod 755 *.pdf
	pdflatex hpsg2013.tex
	pdflatex hpsg2013.tex


toc.shtml: conference.txt workshop.txt $(PROGRAM)
	gen-hpsg-proceedings


o-public: toc.shtml hpsg2013.pdf
	kinit --password-file=/Volumes/Verschlüsselt/kinit-file stefanm@stanford.edu
	rsync -a -e ssh . stefanm@cardinal.stanford.edu:/afs/ir.stanford.edu/group/cslipublications/WWW/cslipublications/HPSG/2013/
#	rsync -a -e ssh . stefanm@turing2.stanford.edu:/turing/u3/www/html-csliweb/publications/HPSG/2013/

html-public: 
	scp -p  *.shtml stefanm@turing2.stanford.edu:/turing/u3/www/html-csliweb/publications/HPSG/2013/

clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.out

realclean: clean
	rm -f hpsg2011.pdf
