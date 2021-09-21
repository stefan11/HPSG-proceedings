all: example.pdf hpsg2015.pdf guidelines.pdf toc.shtml

PROGRAM=~stefan/bin/gen-hpsg-proceedings

FILES=config.pl Includes/ahmw.pdf Includes/hamw.pdf Includes/alqurashi.pdf Includes/oshima.pdf


example.pdf: example.tex
	pdflatex example.tex
	bibtex example
	pdflatex example.tex
	pdflatex example.tex

guidelines.pdf: guidelines.tex
	pdflatex guidelines.tex
	pdflatex guidelines.tex

hpsg2015.tex: editors-note.tex conference.txt workshop.txt $(PROGRAM) $(FILES)
	gen-hpsg-proceedings

hpsg2015.pdf: hpsg2015.tex 
	chmod 755 *.pdf
	pdflatex hpsg2015.tex
	pdflatex hpsg2015.tex


toc.shtml: conference.txt workshop.txt $(PROGRAM)
	gen-hpsg-proceedings


o-public: toc.shtml hpsg2015.pdf
	kinit --password-file=/Volumes/Verschlüsselt/kinit-file stefanm@stanford.edu
	rsync -a -e ssh . stefanm@cardinal.stanford.edu:/afs/ir.stanford.edu/group/cslipublications/WWW/cslipublications/HPSG/2015/
#	rsync -a -e ssh . stefanm@turing2.stanford.edu:/turing/u3/www/html-csliweb/publications/HPSG/2013/

#o-public: toc.shtml hpsg2015.pdf
#	rsync -a -e ssh . stefan@home.hpsg.fu-berlin.de:/home/stefan/public_html/Editing-New/HPSG/2015/

html-public: 
	scp -p  *.shtml stefanm@turing2.stanford.edu:/turing/u3/www/html-csliweb/publications/HPSG/2015/

clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.out

realclean: clean
	rm -f hpsg2015.pdf
