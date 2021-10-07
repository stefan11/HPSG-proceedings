
all: example.pdf guidelines.pdf


example.pdf: example.tex
	xelatex example.tex
	bibtex example
	xelatex example.tex
	xelatex example.tex

guidelines.pdf: guidelines.tex
	xelatex guidelines.tex
	xelatex guidelines.tex


xml:
	for number in 2003 2004 2005 2006 2007 2008 2009 2010 ; do \
		echo $$number ; \
		(cd $$number; make) ; \
		cp $$number/hpsg$$number.xml XML-files ; \
	done	

o-public: xml
	zip hpsg-xml.zip XML-files/*
	scp hpsg-xml.zip ag-syntax:public_html/Editing-New/HPSG-proceedings/

clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.out *.toc *.tmp *~

realclean: clean
	rm -f *.pdf 
