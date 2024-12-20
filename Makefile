
all: example.pdf guidelines.pdf


example.pdf: example.tex
	xelatex example.tex
	biber example
	xelatex example.tex
	xelatex example.tex

guidelines.pdf: guidelines.tex
	xelatex guidelines.tex
	xelatex guidelines.tex


xml:
	for number in 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022; do \
		echo $$number ; \
		(cd $$number; make) ; \
		cp $$number/*$$number.xml XML-files ; \
	done	


bib: xml
	cat */*-crossref.bib > hpsg-proceedings.bib

o-public: xml
	zip hpsg-xml.zip XML-files/*
	scp hpsg-xml.zip ag-syntax:public_html/transfer/

clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.out *.toc *.tmp *~

realclean: clean
	rm -f *.pdf 
