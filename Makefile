TEX=pdflatex -interaction nonstopmode thesis.tex
BIB=bibtex thesis.aux
FULL=perl -ni -e 's/(\\documentclass\[.*?)(,draft)/$1/; print' thesis.tex
DRAFT=perl -ni -e 's/(\\documentclass\[.*?(?<!,draft))\]/$1,draft\]/; print' thesis.tex

thesis:
	pdflatex thesis.tex
	bibtex thesis.aux||true
	pdflatex thesis.tex
	pdflatex thesis.tex

clean:
	rm -rf *.aux *.bbl *.lof *.lot *.log *.blg *.toc
