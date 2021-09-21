all: example.pdf hpsg10.pdf guidelines.pdf



example.pdf: example.tex
	pdflatex example.tex
	bibtex example
	pdflatex example.tex
	pdflatex example.tex

guidelines.pdf: guidelines.tex
	pdflatex guidelines.tex
	pdflatex guidelines.tex


hpsg10.pdf: hpsg10.tex
	chmod 755 *.pdf
	pdflatex hpsg10.tex
	pdflatex hpsg10.tex
	mv hpsg10.pdf ..



o-public: 
	scp -p  *.shtml *.tex *.pdf *.bib *.bst *.css stefanm@turing2.stanford.edu:/turing/u3/www/html-csliweb/publications/HPSG/9/

html-public: 
	scp -p  *.shtml stefanm@turing2.stanford.edu:/turing/u3/www/html-csliweb/publications/HPSG/9/

clean:
	rm -f *.bak *~ *.log *.blg *.bbl *.aux *.out

realclean: clean
	rm -f hpsg04.pdf