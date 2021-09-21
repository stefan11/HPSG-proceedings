all: example.pdf hpsg2017.pdf guidelines.pdf toc.shtml

PROGRAM=~stefan/bin/gen-hpsg-proceedings

FILES=config.pl 


example.pdf: example.tex
	pdflatex example.tex
	bibtex example
	pdflatex example.tex
	pdflatex example.tex

guidelines.pdf: guidelines.tex
	xelatex guidelines.tex
	xelatex guidelines.tex

#hpsg2017.tex: editors-note.tex conference.txt workshop.txt $(PROGRAM) $(FILES)
hpsg2017.tex: editors-note.tex conference.txt $(PROGRAM) $(FILES)
	gen-hpsg-proceedings

hpsg2017.pdf: hpsg2017.tex 
	chmod 755 *.pdf
	pdflatex hpsg2017.tex
	pdflatex hpsg2017.tex


toc.shtml: conference.txt workshop.txt $(PROGRAM)
	gen-hpsg-proceedings

# toc.shtml hpsg2017.pdf
o-public: guidelines.pdf hpsg2017.pdf
	kinit --password-file=/Volumes/Verschlüsselt/kinit-file stefanm@stanford.edu
#	rsync -a -e ssh . stefanm@corn.stanford.edu:/afs/ir.stanford.edu/group/cslipublications/WWW/cslipublications/HPSG/2017/
	rsync -a -e ssh . stefanm@cardinal.stanford.edu:/afs/ir.stanford.edu/group/cslipublications/WWW/cslipublications/HPSG/2017/
#	rsync -a -e ssh . stefanm@turing2.stanford.edu:/turing/u3/www/html-csliweb/publications/HPSG/2013/

#o-public: toc.shtml hpsg2017.pdf
#	rsync -a -e ssh . stefan@home.hpsg.fu-berlin.de:/home/stefan/public_html/Editing-New/HPSG/2017/

html-public: 
	scp -p  *.shtml stefanm@turing2.stanford.edu:/turing/u3/www/html-csliweb/publications/HPSG/2017/

clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.out

realclean: clean
	rm -f hpsg2017.pdf
