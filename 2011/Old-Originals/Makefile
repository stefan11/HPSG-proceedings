all: hpsg2011.pdf



example.pdf: example.tex
	pdflatex example.tex
	bibtex example
	pdflatex example.tex
	pdflatex example.tex

guidelines.pdf: guidelines.tex
	pdflatex guidelines.tex
	pdflatex guidelines.tex


hpsg2011.pdf: hpsg2011.tex
	chmod 755 *.pdf
	pdflatex hpsg2011.tex
	pdflatex hpsg2011.tex
	mv hpsg2011.pdf ..



o-public: 
	scp -p  *.shtml *.tex *.pdf *.bib *.bst *.css stefanm@turing2.stanford.edu:/turing/u3/www/html-csliweb/publications/HPSG/9/

html-public: 
	scp -p  *.shtml stefanm@turing2.stanford.edu:/turing/u3/www/html-csliweb/publications/HPSG/9/

clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.out

realclean: clean
	rm -f hpsg04.pdf