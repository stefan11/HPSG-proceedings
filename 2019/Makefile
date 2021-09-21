YEAR=2019
all: example.pdf hpsg$(YEAR).pdf guidelines.pdf toc.shtml

PROGRAM=~stefan/bin/gen-hpsg-proceedings

FILES=config.pl 


example.pdf: example.tex
	xelatex example.tex
	bibtex example
	xelatex example.tex
	xelatex example.tex

guidelines.pdf: guidelines.tex
	xelatex guidelines.tex
	xelatex guidelines.tex

#hpsg2017.tex: editors-note.tex conference.txt workshop.txt $(PROGRAM) $(FILES)
hpsg$(YEAR).tex: editors-note.tex conference.txt $(PROGRAM) $(FILES)
	gen-hpsg-proceedings

hpsg$(YEAR).pdf: hpsg$(YEAR).tex 
	chmod 755 *.pdf
	pdflatex hpsg$(YEAR).tex
	pdflatex hpsg$(YEAR).tex


#toc.shtml: conference.txt workshop.txt $(PROGRAM)
toc.shtml: conference.txt $(PROGRAM)
	gen-hpsg-proceedings

# toc.shtml hpsg2017.pdf
o-public: guidelines.pdf hpsg$(YEAR).pdf toc.shtml
	kinit --password-file=/Volumes/Verschlüsselt/kinit-file stefanm@stanford.edu
#	rsync -a -e ssh . stefanm@corn.stanford.edu:/afs/ir.stanford.edu/group/cslipublications/WWW/cslipublications/HPSG/2017/
	rsync -a -e ssh . stefanm@cardinal.stanford.edu:/afs/ir.stanford.edu/group/cslipublications/WWW/cslipublications/HPSG/$(YEAR)/
#	rsync -a -e ssh . stefanm@turing2.stanford.edu:/turing/u3/www/html-csliweb/publications/HPSG/2013/

#o-public: toc.shtml hpsg2017.pdf
#	rsync -a -e ssh . stefan@home.hpsg.fu-berlin.de:/home/stefan/public_html/Editing-New/HPSG/2017/

html-public: 
	scp -p  *.shtml stefanm@turing2.stanford.edu:/turing/u3/www/html-csliweb/publications/HPSG/2017/

clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.out *.toc *.tmp *~

realclean: clean
	rm -f hpsg2017.pdf
